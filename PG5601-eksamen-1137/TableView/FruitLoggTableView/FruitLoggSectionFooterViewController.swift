//
//  FruitLoggSectionFooterViewController.swift
//  PG5601-eksamen-1137
//
//  Created by Bruker on 23/11/2022.
//

import UIKit

class FruitLoggSectionFooterViewController: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet var caloriesLabel: UILabel!
    @IBOutlet var carboHydratesLabel: UILabel!
    @IBOutlet var fatLabel: UILabel!
    @IBOutlet var proteinLabel: UILabel!
    @IBOutlet var sugarLabel: UILabel!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 104)
    }
    
    private func commonInit(){
        let bundle = Bundle(for: FruitLoggSectionFooterViewController.self)
        bundle.loadNibNamed("FruitLoggSectionFooterViewController", owner: self, options: nil)
        addSubview(contentView)
        
//      Lagt til constraints både på storyBoard og programatisk her.

        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
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
