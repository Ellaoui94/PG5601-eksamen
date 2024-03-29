//
//  FruitLoggTableViewController.swift
//  PG5601-eksamen-1137
//
//  Created by Bruker on 21/11/2022.
//

import UIKit

struct FruitLoggSection{
    let date: Date
    var fruitLogg : [FruitLogg]
}

class FruitLoggTableViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
// Ny struct for loggen
    var fruitLoggSectionArray = [FruitLoggSection]()
    
// For å bli kvitt tid fra Date
    func stripTime(from originalDate: Date) -> Date {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: originalDate)
        let date = Calendar.current.date(from: components)
        return date!
    }
    
    private let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "no_NO")
        formatter.dateFormat = "EEEE, dd/MM/yyyy"
        return formatter
    }()
    
    override func viewWillAppear(_ animated: Bool) {
//    Hvis man går ut og inn igjen fra siden så har arrayet allerede verdier,       disse må slettes for å ungå duplikat
        fruitLoggSectionArray.removeAll()
        
        do{
           let fruitLogg = try context.fetch(FruitLogg.fetchRequest())
            
            fruitLogg.forEach { loggItem in
                if !self.fruitLoggSectionArray.contains(where: {$0.date == stripTime(from: loggItem.dateLogg!)}) {
                    self.fruitLoggSectionArray.append(FruitLoggSection(date: stripTime(from: loggItem.dateLogg!), fruitLogg: [loggItem]))
                }else{
                    guard let index = self.fruitLoggSectionArray.firstIndex(where: {$0.date == stripTime(from: loggItem.dateLogg!)}) else {return}
                    self.fruitLoggSectionArray[index].fruitLogg.append(loggItem)
                }
            }
        }catch{
            let alert = UIAlertController(title: "Data base error!", message: "Could not find data..", preferredStyle: UIAlertController.Style.alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
        
        fruitLoggSectionArray = fruitLoggSectionArray.sorted(by: {$0.date > $1.date})
        self.tableView.reloadData()
    }

    let fruitLoggCell = "fruitLoggCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension FruitLoggTableViewController : UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        .setEmptyMessage er lagt til nederst som en extension av UITableView
        if fruitLoggSectionArray.count == 0 {
            self.tableView.setEmptyMessage("No fruit has been eaten yet..")
        } else {
            self.tableView.restore()
        }
        return fruitLoggSectionArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitLoggSectionArray[section].fruitLogg.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dateFormat.string(from: fruitLoggSectionArray[section].date).capitalized
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//      laget en XIB fil som jeg har koblet til denne klassen
        let footer = FruitLoggSectionFooterViewController()
        
        var caloriesSum = 0.0
        var carbohydratesSum = 0.0
        var fatSum = 0.0
        var proteinSum = 0.0
        var sugarSum = 0.0

        for fruit in fruitLoggSectionArray[section].fruitLogg{
            caloriesSum += fruit.calories
            carbohydratesSum += fruit.carbohydrates
            fatSum += fruit.fat
            proteinSum += fruit.protein
            sugarSum += fruit.sugar
        }
        
//      Formaterer summen for å droppe å ha med for mange siffre: https://stackoverflow.com/a/27339287
        footer.caloriesLabel.text = "Calories: \(String(format: "%.2f", caloriesSum))"
        footer.carboHydratesLabel.text = "Carbs: \(String(format: "%.2f", carbohydratesSum))"
        footer.fatLabel.text = "Fat: \(String(format: "%.2f", fatSum))"
        footer.proteinLabel.text = "Protein: \(String(format: "%.2f", proteinSum))"
        footer.sugarLabel.text = "Sugar: \(String(format: "%.2f", sugarSum))"
        
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: fruitLoggCell) as! FruitLoggTableViewCell
        let fruitLoggItem = fruitLoggSectionArray[indexPath.section].fruitLogg[indexPath.row]
        
        cell.fruitName.text = fruitLoggItem.name
        
        return cell
    }
}

extension UITableView {

    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
