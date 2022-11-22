//
//  FruitLoggViewController.swift
//  PG5601-eksamen-1137
//
//  Created by Bruker on 18/11/2022.
//

import UIKit

class FruitLoggViewController: UIViewController {
    @IBOutlet weak var timePicker: UIDatePicker!
    
    var timeString = ""
    var dateString = ""

    @objc func timePickerValueChanged(sender: UIDatePicker){
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "hh:mm:ss"
        timeString = formatter.string(from: sender.date)
        formatter.dateFormat = "dd:MM:yyyy"
        dateString = formatter.string(from: sender.date)
        print(timeString)
        print(dateString)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timePicker.addTarget(self, action: #selector(timePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)

    }
}
