//
//  FruitLoggTableViewController.swift
//  PG5601-eksamen-1137
//
//  Created by Bruker on 21/11/2022.
//

import UIKit

class FruitLoggTableViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var fruitLogg = [FruitLogg]()
    
    override func viewWillAppear(_ animated: Bool) {
        do{
            fruitLogg = try context.fetch(FruitLogg.fetchRequest())
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
    
    private let timeFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "hh:mm:ss"
        return formatter
    }()
}

extension FruitLoggTableViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitLogg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: fruitLoggCell) as! FruitLoggTableViewCell
        let fruitloggArray = fruitLogg[indexPath.row]
        
        cell.fruitName.text = fruitloggArray.name
        cell.fruitDate.text = timeFormat.string(from: fruitloggArray.dateLogg!)
        cell.sugar.text = "\(fruitloggArray.sugar)"
        cell.fat.text = "\(fruitloggArray.fat)"
        
        return cell
    }
    
    
}
