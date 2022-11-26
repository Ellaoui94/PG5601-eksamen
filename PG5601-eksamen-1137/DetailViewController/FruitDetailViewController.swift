//
//  FruitDetailViewViewController.swift
//  PG5601-eksamen-1137
//
//  Created by Bruker on 12/11/2022.
//

import UIKit

class FruitDetailViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var family: UILabel!
    @IBOutlet weak var order: UILabel!
    @IBOutlet weak var genus: UILabel!
    @IBOutlet weak var carbohydrates: UILabel!
    @IBOutlet weak var protein: UILabel!
    @IBOutlet weak var fat: UILabel!
    @IBOutlet weak var caloreis: UILabel!
    @IBOutlet weak var sugar: UILabel!
    
    @IBOutlet weak var sugarAlert: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var emojiRain: EmojiRain!


    var nameString = ""
    var familyString = ""
    var orderString = ""
    var genusString = ""
    var carbohydratesDouble = 0.0
    var proteinDouble = 0.0
    var fatDouble = 0.0
    var caloreisDouble = 0.0
    var sugarDouble = 0.0
    
    var reloadClosure: ((String) -> ())?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        name.text = nameString
        family.text = familyString
        order.text = orderString
        genus.text = genusString
        carbohydrates.text = "\(carbohydratesDouble)"
        protein.text = "\(proteinDouble)"
        fat.text = "\(fatDouble)"
        caloreis.text = "\(caloreisDouble)"
        sugar.text = "\(sugarDouble)"
        
        sugarAlert.alpha = 0
        
        let sugarD = Double(sugarDouble)
        if sugarD > 10 {
            UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse, .allowUserInteraction], animations: {
                self.view.backgroundColor = .red
                self.sugarAlert.alpha = 1
            }, completion: nil)
        }
        
        emojiRain = EmojiRain(view: self.view)
        emojiRain.fruitName = nameString
        
        switch nameString{
        case "Orange":
            emojiRain.emoji = "🍊"
        case "Banana":
            emojiRain.emoji = "🍌"
        default:
            emojiRain.emoji = "💯"
        }
        emojiRain.start()
    }
    
//    let alert = MyAlert()
    @IBAction func startButtonTapped(sender: UIButton) {
        emojiRain.start()
    }
//    not used yet, maybe l8r?
    private let timeFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "hh:mm:ss"
        return formatter
    }()

    @IBAction func didTapButton(){
        let myDatePicker: UIDatePicker = UIDatePicker()
        myDatePicker.locale = NSLocale(localeIdentifier: "no_NO") as Locale
        myDatePicker.timeZone = .current
        myDatePicker.preferredDatePickerStyle = .wheels
        myDatePicker.frame = CGRect(x: 0, y: 15, width: 270, height: 200)
        
        let alertController = UIAlertController(title: "When did you eat?\n\n\n\n\n\n\n", message: nil, preferredStyle: .alert)
           alertController.view.addSubview(myDatePicker)
           
        let selectAction = UIAlertAction(title: "Save", style: .default, handler: { [self] _ in
            let newFruitLogg = FruitLogg(context: context)
            
            newFruitLogg.name = nameString
            newFruitLogg.fat = fatDouble
            newFruitLogg.carbohydrates = carbohydratesDouble
            newFruitLogg.sugar = sugarDouble
            newFruitLogg.calories = caloreisDouble
            newFruitLogg.protein = proteinDouble
            newFruitLogg.dateLogg = myDatePicker.date
            
            do{
                try context.save()
            }catch{
                print("kl")
            }
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alertController.addAction(selectAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
}

//
//class MyAlert{
//    struct Constatns {
//        static let backgroundAlphaTo: CGFloat = 0.6
//    }
//
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//
//    var timeString = ""
//    var dateString = ""
//    var test = ""
//
//    private let timeFormat: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.locale = Locale(identifier: "en_gb")
//        formatter.dateFormat = "hh:mm:ss"
//        return formatter
//    }()
//
//    private let dateFormat: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.locale = Locale(identifier: "en_gb")
//        formatter.dateFormat = "dd:MM:yyyy"
//        return formatter
//    }()
//
//    private let backgroundView: UIView = {
//        let backgroundView = UIView()
//        backgroundView.backgroundColor = .black
//        backgroundView.alpha = 0
//        return backgroundView
//    }()
//
//    private let alertView: UIView = {
//        let alert = UIView()
//        alert.backgroundColor = .white
//        alert.layer.masksToBounds = true
//        alert.layer.cornerRadius = 12
//        return alert
//    }()
//
//    private var myTargetView = UIView()
//
//    @objc func timePickerValueChanged(sender: UIDatePicker){
//        timeString = timeFormat.string(from: sender.date)
//        dateString = dateFormat.string(from: sender.date)
//    }
//
//    @objc func addName(){
//        print(test)
//
//    }
//
//     func showAlert(with title: String, on viewController: UIViewController){
//         guard let targetView = viewController.view else{
//             return
//         }
//
//         myTargetView = targetView
//
//         backgroundView.frame = targetView.bounds
//         targetView.addSubview(backgroundView)
//         targetView.addSubview(alertView)
//         alertView.frame = CGRect(x: 40, y: -300, width: targetView.frame.size.width - 80, height: 200)
//
//         let timeDateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: alertView.frame.size.width, height: 80))
//         timeDateLabel.text = title
//         timeDateLabel.textAlignment = .center
//
//         alertView.addSubview(timeDateLabel)
//
//         let datePicker = UIDatePicker(frame: CGRect(x: -55, y: 80, width: alertView.frame.size.width, height: 170))
//
//         datePicker.locale = NSLocale(localeIdentifier: "en_GB") as Locale
//
//         timeString = timeFormat.string(from: datePicker.date)
//         dateString = dateFormat.string(from: datePicker.date)
//
//         datePicker.addTarget(self, action: #selector(timePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
//
//         alertView.addSubview(datePicker)
//
//         let addLoggBtn = UIButton(frame: CGRect(x: 0, y: alertView.frame.size.height-50, width: alertView.frame.size.width/2, height: 50))
//
//         addLoggBtn.setTitle("Save", for: .normal)
//         addLoggBtn.backgroundColor = .link
//         addLoggBtn.setTitleColor(.white, for: .normal)
//         addLoggBtn.addTarget(self, action: #selector(addName), for: .touchUpInside)
//
//         let cancelBtn = UIButton(frame: CGRect(x: 160, y: alertView.frame.size.height-50, width: alertView.frame.size.width/2, height: 50))
//
//         cancelBtn.setTitle("Cancel", for: .normal)
//         cancelBtn.backgroundColor = .systemYellow
//         cancelBtn.setTitleColor(.black, for: .normal)
//         cancelBtn.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
//
//         alertView.addSubview(addLoggBtn)
//         alertView.addSubview(cancelBtn)
//
//         UIView.animate(withDuration: 0.25, animations: {
//             self.backgroundView.alpha = Constatns.backgroundAlphaTo
//         }, completion: {done in
//             if done {
//                 UIView.animate(withDuration: 0.25, animations: {
//                     self.alertView.center = targetView.center
//                })
//             }
//         })
//     }
//
//    @objc func dismissAlert(){
//         let targetView = myTargetView
//
//        UIView.animate(withDuration: 0.25, animations: {
//            self.alertView.frame = CGRect(x: 40, y: targetView.frame.size.height, width: targetView.frame.size.width - 80, height: 300)
//        }, completion: {done in
//            if done {
//                UIView.animate(withDuration: 0.25, animations: {
//                    self.backgroundView.alpha = 0
//                }, completion: { done in
//                    if done{
//                        self.alertView.removeFromSuperview()
//                        self.backgroundView.removeFromSuperview()
//                    }
//                })
//            }
//        })
//    }
//}
//
