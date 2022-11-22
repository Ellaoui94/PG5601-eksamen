//
//  FruitLoggTableViewCell.swift
//  PG5601-eksamen-1137
//
//  Created by Bruker on 21/11/2022.
//

import UIKit

class FruitLoggTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fruitName: UILabel!
    @IBOutlet weak var fruitDate: UILabel!
    @IBOutlet weak var sugar: UILabel!
    @IBOutlet weak var fat: UILabel!



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
