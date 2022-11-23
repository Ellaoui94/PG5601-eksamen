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
    
    var fruitLoggSectionArray = [FruitLoggSection]()
    
    
    func stripTime(from originalDate: Date) -> Date {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: originalDate)
        let date = Calendar.current.date(from: components)
        return date!
    }
    
    private let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "no_NO")
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
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
            self.tableView.reloadData()
        }catch{
            print("ohno")
        }
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
        return fruitLoggSectionArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitLoggSectionArray[section].fruitLogg.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dateFormat.string(from: fruitLoggSectionArray[section].date)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: fruitLoggCell) as! FruitLoggTableViewCell
        let fruitLoggItem = fruitLoggSectionArray[indexPath.section].fruitLogg[indexPath.row]
        
        cell.fruitName.text = fruitLoggItem.name
        
        return cell
    }
}
