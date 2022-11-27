//
//  ViewController.swift
//  PG5601-eksamen-1137
//
//  Created by Bruker on 12/11/2022.
//

import UIKit



class FruitTableView: UIViewController{
    
    var fruitCell = "fruitCell"
    var url = "https://fruityvice.com/api/fruit/all"
    
    var fruitMap = [String : UIColor]()
    
    @IBOutlet var tableView: UITableView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        FruitData.frutisJSON(url: url, viewController: self, completed: {
            self.tableView.reloadData()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func generateRandomColor() -> UIColor {
           let redValue = CGFloat(drand48())
           let greenValue = CGFloat(drand48())
           let blueValue = CGFloat(drand48())

           let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)

           return randomColor
       }
    }

extension FruitTableView : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FruitData.fruits.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: fruitCell) as! FruitTableViewCell
        let fruit = FruitData.fruits[indexPath.row]
        
        cell.fruitName.text = fruit.name
        
        if (fruitMap.index(forKey: fruit.family) == nil){
            fruitMap[fruit.family] = generateRandomColor()
        }
        
        cell.furitColor.backgroundColor = fruitMap[fruit.family]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "FruitDetailViewController") as! FruitDetailViewController
        let fruitsData = FruitData.fruits[indexPath.row]
        
                
        viewController.nameString = fruitsData.name
        viewController.familyString = fruitsData.family
        viewController.genusString = fruitsData.genus
        viewController.orderString = fruitsData.order
        viewController.carbohydratesDouble = fruitsData.nutritions.carbohydrates
        viewController.proteinDouble = fruitsData.nutritions.protein
        viewController.fatDouble = fruitsData.nutritions.fat
        viewController.caloreisDouble = fruitsData.nutritions.calories
        viewController.sugarDouble = fruitsData.nutritions.sugar
        
        show(viewController, sender: nil)

    }
}


