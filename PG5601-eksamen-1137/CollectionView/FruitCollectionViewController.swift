//
//  FruitCViewController.swift
//  PG5601-eksamen-1137
//
//  Created by Bruker on 16/11/2022.
//

import UIKit

class FruitCollectionViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    var fruitCell = "fruitCell"
    var fruitHeaderName = "fruitHeaderName"
    
    var url = "https://fruityvice.com/api/fruit/all"
    

    override func viewWillAppear(_ animated: Bool) {
        FruitData.frutisJSON(url: url, viewController: self, completed: {
            self.collectionView.reloadData()
        })
    }
    
    var sortedGenus = [String]()
    var sortedFamily = [String]()
    var sortedOrder = [String]()
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        let genusMap = Array(Set(FruitData.fruits.map{ $0.genus }))
        sortedGenus.append(contentsOf: genusMap)
        
        let familyMap = Array(Set(FruitData.fruits.map{ $0.family }))
        sortedFamily.append(contentsOf: familyMap)
        
        let orderMap = Array(Set(FruitData.fruits.map{$0.order}))
        orderMap.forEach { order in
                if !(order == "None"){
                sortedOrder.append(order)
                }
            }
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FruitCollectionViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let genus = Array(Set(FruitData.fruits.map{ $0.genus }))
        let family = Array(Set(FruitData.fruits.map{ $0.family }))

        let order = Array(Set(FruitData.fruits.map{ $0.order }))

        switch section{
        case 0: return genus.count
        case 1: return family.count
        case 2: return sortedOrder.count
        default:
            return 0
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: fruitCell, for: indexPath) as! FruitCollectionViewCell
         
        switch indexPath.section{
        case 0:
            cell.fruitName.text = sortedGenus[indexPath.row]
        case 1:
            cell.fruitName.text = sortedFamily[indexPath.row]
        case 2:
            cell.fruitName.text = sortedOrder[indexPath.row]
        default:
            cell.fruitName.text = "No data found.."
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: fruitHeaderName, for: indexPath) as! FruitCollectionViewHeaderReusableView
        
        switch indexPath.section{
        case 0:  header.familyHeader.text = "Genus"
        case 1:  header.familyHeader.text = "Family"
        case 2:  header.familyHeader.text = "Order"
        default:
            header.familyHeader.text = "Unkown section"
        }
        return header
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let param: String
        let type: String
        let fruitData = FruitData.fruits[indexPath.row]

        switch indexPath.section{
        case 0:
            type = "genus"
            param = fruitData.genus
        case 1:
            type = "family"
            param = fruitData.family
        case 2:
            type = "order"
            param = fruitData.order
        default:
            type = "No type"
            param = "No param"
        }

        let viewController = storyboard.instantiateViewController(withIdentifier: "FruitTableView") as! FruitTableView
        viewController.url = "https://fruityvice.com/api/fruit/\(type)/\(param)"

        show(viewController, sender: nil)
    }
}
