//
//  FruitData.swift
//  PG5601-eksamen-1137
//
//  Created by Bruker on 14/11/2022.
//

import Foundation

class FruitData{
    static var fruits = [Fruit]()
    
    static func frutisJSON(url: String, completed: @escaping ()-> ()){
        let url = URL.init(string: url)!
        
        let fruitsData = URLSession.shared.dataTask(with: URLRequest.init(url: url)) {
            data, response, error in
            
            if let data = data {
                FruitData.fruits = try! JSONDecoder().decode( [Fruit].self, from: data).sorted(by: { $0.id < $1.id })
            } else{
                print("error")
            }
                DispatchQueue.main.async {
                    completed()
                }
            }
        fruitsData.resume()
        }
    
    static let shared = FruitData()
    
    private let family: FruitSection = {
        .family(Dictionary(grouping: fruits) { $0.family })
    }()
    
    private let genus: FruitSection = {
        .genus(Dictionary(grouping: fruits, by: \.genus).filter{$0.value.count > 1})
    }()
    
    private let order: FruitSection = {
        .order(Dictionary(grouping: fruits, by: \.order).filter{$0.value.count > 1})
    }()
    
    var filteredData: [FruitSection] {
        [family, genus, order]
    }

}
