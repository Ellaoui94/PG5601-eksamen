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
//            Hvis det ikke er noe kobling til nettet, så skal en alert komme opp
            if (error != nil) {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Connection error!", message: "No internet connection...", preferredStyle: UIAlertController.Style.alert)
                    let cancelAction = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
                    alert.addAction(cancelAction)
                    viewController.present(alert, animated: true, completion: nil)
                }
                return
            }
//            Sender inn en @escaping funkjson når api kallet er gjort, bruker den for .reloadData()
                DispatchQueue.main.async {
                    completed()
                }
            }
        fruitsData.resume()
        }
}
