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
    
//    Siden url-en i FruitTableView skal forandres, måtte jeg få denne klassen til å bruke sitt eget url
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
        
//        For å slippe å få duplikat verdier
        let genusMap = Array(Set(FruitData.fruits.map{ $0.genus }))
        sortedGenus.append(contentsOf: genusMap)
        
        let familyMap = Array(Set(FruitData.fruits.map{ $0.family }))
        sortedFamily.append(contentsOf: familyMap)
        
        let orderMap = Array(Set(FruitData.fruits.map{$0.order}))
//       En av Order-ene heter "None", den ønsket jeg ikke å ha med
        orderMap.forEach { order in
                if !(order == "None"){
                sortedOrder.append(order)
                }
            }
        }
}

extension FruitCollectionViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section{
        case 0: return sortedGenus.count
        case 1: return sortedFamily.count
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
        
//        Endrer url propertien til et nytt kall med gitt type og param(navnet på cellen som blir valgt)
        
        let param: String
        let type: String

        switch indexPath.section{
        case 0:
            type = "genus"
            param = sortedGenus[indexPath.row]
        case 1:
            type = "family"
            param = sortedFamily[indexPath.row]
        case 2:
            type = "order"
            param = sortedOrder[indexPath.row]
        default:
            type = "No type"
            param = "No param"
        }

        let fruitTableView = storyboard.instantiateViewController(withIdentifier: "FruitTableView") as! FruitTableView
        fruitTableView.url = "https://fruityvice.com/api/fruit/\(type)/\(param)"

        show(fruitTableView, sender: nil)
    }
}
