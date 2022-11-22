//
//  FuritTableViewCell.swift
//  PG5601-eksamen-1137
//
//  Created by Bruker on 12/11/2022.
//

import UIKit

class FruitTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fruitName: UILabel!
    @IBOutlet weak var furitColor: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
