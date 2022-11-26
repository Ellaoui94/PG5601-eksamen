//
//  FruitData.swift
//  PG5601-eksamen-1137
//
//  Created by Bruker on 14/11/2022.

import Foundation
import UIKit

class FruitData{
    static var fruits = [Fruit]()
    
    static func frutisJSON(url: String, viewController: UIViewController, completed: @escaping ()-> ()){
        let url = URL.init(string: url)!
        
        let fruitsData = URLSession.shared.dataTask(with: URLRequest.init(url: url)) {
            data, response, error in
            
            if let data = data {
                FruitData.fruits = try! JSONDecoder().decode( [Fruit].self, from: data).sorted(by: { $0.id < $1.id })
            }
            if (error != nil) {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Connection error!", message: "No internet connection...", preferredStyle: UIAlertController.Style.alert)
                    let cancelAction = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
                    alert.addAction(cancelAction)
                    viewController.present(alert, animated: true, completion: nil)
                }
                return
            }
                DispatchQueue.main.async {
                    completed()
                }
            }
        fruitsData.resume()
        }
    
    static let shared = FruitData()
    
//    private let family: FruitSection = {
//        .family(Dictionary(grouping: fruits) { $0.family })
//    }()
//    
//    private let genus: FruitSection = {
//        .genus(Dictionary(grouping: fruits, by: \.genus).filter{$0.value.count > 1})
//    }()
//    
//    private let order: FruitSection = {
//        .order(Dictionary(grouping: fruits, by: \.order).filter{$0.value.count > 1})
//    }()
//    
//    var filteredData: [FruitSection] {
//        [family, genus, order]
//    }

}
