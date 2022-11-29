//
//  FruitDetailViewViewController.swift
//  PG5601-eksamen-1137
//
//  Created by Bruker on 26/11/2022.
//

import Foundation
import UIKit

class EmojiRain {
    
    // MARK: - Properties
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var fruitLoggArray = [FruitLogg]()
    
    
    // MARK: Views
    var view: UIView!
    private var drops: [UIView] = []
    private var dropColor = UIColor(red:0.56, green:0.76, blue:0.85, alpha:1.0)
    
    // MARK: Drop positions
    private var startX: CGFloat!
    private var startY: CGFloat!
    private var distanceBetweenEachDrop: CGFloat!
    private var distanceBetweenSameRow: CGFloat!
    
    // MARK: Drop behaviors
    private var animator: UIDynamicAnimator!
    private var gravityBehavior = UIGravityBehavior()
    private var timer1 = Timer()
    
    // MARK: State
    var isAnimating = false
    
    var emoji = "💯"
    var fruitName = ""
    
    // MARK: - Methods
    init(view: UIView) {
        // Henter viewet som blir satt inn i initilaizeren 
        self.view = view
        let width = self.view.frame.width
        
        // Setter posisjon for emojiene og setter avstand mellom dem
        startX = 20
        startY = -60
        distanceBetweenEachDrop = width * 0.048
        distanceBetweenSameRow = distanceBetweenEachDrop * 2
        
        animator = UIDynamicAnimator(referenceView: self.view)
        gravityBehavior.gravityDirection.dy = 2
        animator.addBehavior(gravityBehavior)
    }
    
    func start() {
        isAnimating = true
        // Kaller på funksjonen som får emojiene til å regne ned  hvert .2 sekund.
        timer1 = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(spawnFirst), userInfo: nil, repeats: false)
    }
    
    // MARK: - Helper Methods
    
    private func addGravity(array: [UIView]) {

        for drop in array {
            gravityBehavior.addItem(drop)
        }
        
        // Ser etter om hver emoji er under skjermen, hvis ja så fjernes graviteten fra de og de blir tatt vek fra arrayet
        
        // Siden jeg ikke kunne bruke index(i) med drops.count, så måtte jeg ha med .enumarated().reversed()
        for (i, _) in drops.enumerated().reversed() {
            if drops[i].frame.origin.y > self.view.frame.height {
                gravityBehavior.removeItem(drops[i])
                drops[i].removeFromSuperview()
                drops.remove(at:i)
            }
        }
    }
    
    @objc private func spawnFirst() {
        do{
           fruitLoggArray = try context.fetch(FruitLogg.fetchRequest())
            
            }catch{
            print("No data")
        }
        
//      Trenger en array av UIViews for å ha emojiene i
        var thisArray: [UIView] = []
        
        fruitLoggArray.forEach { fruitLogg in
//          Lager en tidsperiode fra -30 dager til dagens dato
            let now = Date.now
            let fromDate = Calendar.current.date(byAdding: .day, value: -30, to: now)
            let range = fromDate!...now
            
//          Hvis navnet til frukten finnes i loggen og datoen er innenfor tidsperioden, så vis emoji
            if fruitLogg.name == fruitName && range.contains(fruitLogg.dateLogg!){
                
//              Nye y og x verdier for view-et for når de faller ned
                let newY = CGFloat(-200 + Int(arc4random_uniform(UInt32(150))))
                let newX = CGFloat(10 + Int(arc4random_uniform(UInt32(350))))
                
                let drop = UIView()
                
                let label = UILabel(frame: CGRect(x: 0,y: 0,width: 100,height: 23))
                
                label.text = emoji
//                Gir label skalerings verdier som starter med 2
                label.transform = label.transform.scaledBy(x: 2, y: 2);
                UIView.animate(withDuration: 1.8, animations: {
//                    Mens animasjonen kjører, så scaleres label ned til 0.1
                    label.transform = label.transform.scaledBy(x: 0.1, y: 0.1);
                })
                
                drop.addSubview(label)
                
                drop.frame = CGRect(x: newX, y: newY, width: 1.0, height: 50.0)

                self.view.addSubview(drop)

                // For å få gjort UIView-et som ble laged inne her tilgjengelig for andre klasser
                self.drops.append(drop)

                thisArray.append(drop)
            }
        }
      
        // For å gi gravitet til array og senere få fjernet droppene som ble lagt til
        addGravity(array: thisArray)
    }
    
    func stop() {
        isAnimating = false

        drops.removeAll()
        // Stopper timmeren som kjører hvert .2 sekund siden arrayet er tomt
        timer1.invalidate()
    }
    
}
