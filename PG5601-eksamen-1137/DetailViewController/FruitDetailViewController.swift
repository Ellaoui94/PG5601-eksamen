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
        
        if sugarDouble > 10 {
            UIView.animate(withDuration: 0.8, delay: 0, options: [.repeat, .autoreverse, .allowUserInteraction], animations: {
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
        case "Tomato":
            emojiRain.emoji = "🍅"
        case "Lemon":
            emojiRain.emoji = "🍋"
        case "Pear":
            emojiRain.emoji = "🍐"
        case "Melon":
            emojiRain.emoji = "🍈"
        case "Watermelon":
            emojiRain.emoji = "🍉"
        case "Apple":
            emojiRain.emoji = "🍎"
        case "Grapes":
            emojiRain.emoji = "🍇"
        case "Strawberry":
            emojiRain.emoji = "🍓"
        case "Blueberry":
            emojiRain.emoji = "🫐"
        case "Cherry":
            emojiRain.emoji = "🍒"
        case "Apricot":
            emojiRain.emoji = "🍑"
        case "Mango":
            emojiRain.emoji = "🥭"
        case "Pineapple":
            emojiRain.emoji = "🍍"
        case "Kiwi":
            emojiRain.emoji = "🥝"
        default:
            emojiRain.emoji = "💯"
        }
        emojiRain.start()
    }
    
    @IBAction func startButtonTapped(sender: UIButton) {
        emojiRain.start()
    }

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
                let alert = UIAlertController(title: "Database error!", message: "Could not save data..", preferredStyle: UIAlertController.Style.alert)
                let cancelAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
                alert.addAction(cancelAction)
                self.present(alert, animated: true, completion: nil)
            }
            
            _ = navigationController?.popViewController(animated: true)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alertController.addAction(selectAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
}
