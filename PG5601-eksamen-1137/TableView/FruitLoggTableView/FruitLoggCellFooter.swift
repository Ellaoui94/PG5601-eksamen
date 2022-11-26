//
//  FruitLoggCellFooter.swift
//  PG5601-eksamen-1137
//
//  Created by Bruker on 23/11/2022.
//

import UIKit

class FruitLoggCellFooter: UITableViewHeaderFooterView {
    static let identifier = "FruitLoggCellFooter"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "DADa"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let labelTwo: UILabel = {
        let label = UILabel()
        label.text = "GogOG"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    override init(reuseIdentifier: String?){
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(labelTwo)
        backgroundColor = .systemCyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.sizeToFit()
        labelTwo.sizeToFit()
        
        let width = contentView.frame.size.width
        let height = contentView.frame.size.height
        label.frame = CGRect(x: 0, y: 0, width: width, height: height/2)
        labelTwo.frame = CGRect(x: 0, y: height/2, width: width, height: height/2)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
