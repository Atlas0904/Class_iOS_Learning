//
//  ViewController.swift
//  taxiCost
//
//  Created by atlas on 2016/3/14.
//  Copyright © 2016年 atlas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentPlace = "taipei"
    var dist = 0
    var delay = 0
    var night = false
    var taipeiTaxi = TaipeiTaxi()
    var taichungTaxi = TaichungTaxi()
    var kaoshiungTaxi = KaoshiungTaxi()
    var currentTaxi: Taxi?

    @IBOutlet weak var inputTextDist: UITextField!
    @IBOutlet weak var inputTextDelay: UITextField!
    
    @IBOutlet weak var labelNightMode: UILabel!
    @IBOutlet weak var labelCount: UILabel!
    @IBOutlet weak var switchNightMode: UISwitch!
 
    class Taxi {
        
        var price = 0   // 總價
        var place = ""  // 哪裡的 Taxi
        
        var startDistMeter = 0  // 初始公尺數
        var startPrice = 0  // 初始價錢
        
        var perCostWithDist = 0  // 每單位的多少距離
        var perDistKmPrice = 0  // 每單位的價錢
        
        var perDelayCost = 0  // 每單位dealy多少時間
        var perCostWithDelaySec = 0  // 每單位delay多少錢
        
        var nightMode = false
        
        init(place: String, starDistMeter: Int, startPrice: Int, perCostWithDist: Int, perDistKmPrice: Int, perDelayCost: Int, perCostWithDelaySec: Int) {
            self.place = place
            self.startDistMeter = starDistMeter
            self.startPrice = startPrice
            self.perCostWithDist = perCostWithDist
            self.perDistKmPrice = perDistKmPrice
            self.perDelayCost = perDelayCost
            self.perCostWithDelaySec = perCostWithDelaySec
        }
        convenience init() {
            self.init(place: "Default", starDistMeter: 0, startPrice: 0, perCostWithDist: 0, perDistKmPrice: 0, perDelayCost: 0, perCostWithDelaySec: 0)
        }
        
        func countCost(distMeter: Int, delaySec: Int, night: Bool) -> Int {
            var count: Double = Double(distMeter - startDistMeter) / Double(perCostWithDist)
            let countSec: Int = Int(delaySec/perCostWithDelaySec)
            
            count = (count >= 0) ? floor(count): 0
            price = startPrice + Int(count) * perDistKmPrice
            price += countSec * perDelayCost
            return price
        }
        
        func setNightMode (nightMode: Bool) {
            self.nightMode = nightMode
        }
    }
    
    class TaipeiTaxi: Taxi {
        var additionBilling: Int = 0;
        
        override init(place: String, starDistMeter: Int, startPrice: Int, perCostWithDist: Int, perDistKmPrice: Int, perDelayCost: Int, perCostWithDelaySec: Int) {
            super.init(place: place, starDistMeter: starDistMeter, startPrice: startPrice, perCostWithDist: perCostWithDist, perDistKmPrice: perDistKmPrice, perDelayCost: perDelayCost, perCostWithDelaySec: perCostWithDelaySec)
            self.additionBilling = 20   // 台北加收 20
        }
        convenience init() {
            self.init(place: "Taipie", starDistMeter: 1250, startPrice: 70, perCostWithDist: 200, perDistKmPrice: 5, perDelayCost: 5, perCostWithDelaySec: 1 * 60 + 20)
        }
        
        override func countCost(distMeter: Int, delaySec: Int, night: Bool) -> Int {
            return  super.countCost(distMeter, delaySec: delaySec, night: night) + (nightMode ? additionBilling : 0)
        }
        
    }
    
    class TaichungTaxi: Taxi {
        var additionBillingRate: Double = 0.0
        
        override init(place: String, starDistMeter: Int, startPrice: Int, perCostWithDist: Int, perDistKmPrice: Int, perDelayCost: Int, perCostWithDelaySec: Int) {
            super.init(place: place, starDistMeter: starDistMeter, startPrice: startPrice, perCostWithDist: perCostWithDist, perDistKmPrice: perDistKmPrice, perDelayCost: perDelayCost, perCostWithDelaySec: perCostWithDelaySec)
        }
        convenience init() {
            self.init(place: "TaiChung", starDistMeter: 1500, startPrice: 85, perCostWithDist: 250, perDistKmPrice: 5, perDelayCost: 5, perCostWithDelaySec: 3 * 60)
            self.additionBillingRate = 0.2   // 台中高雄多兩成
        }
        override func countCost(distMeter: Int, delaySec: Int, night: Bool) -> Int {
            return  Int(Double(super.countCost(distMeter, delaySec: delaySec, night: night)) * (nightMode ? (1 + additionBillingRate) : 1))
        }
        
    }
    
    class KaoshiungTaxi: Taxi {
        var additionBillingRate: Double = 0.0;
        
        override init(place: String, starDistMeter: Int, startPrice: Int, perCostWithDist: Int, perDistKmPrice: Int, perDelayCost: Int, perCostWithDelaySec: Int) {
            super.init(place: place, starDistMeter: starDistMeter, startPrice: startPrice, perCostWithDist: perCostWithDist, perDistKmPrice: perDistKmPrice, perDelayCost: perDelayCost, perCostWithDelaySec: perCostWithDelaySec)
        }
        convenience init() {
            self.init(place: "Kaoshiung", starDistMeter: 1500, startPrice: 85, perCostWithDist: 250, perDistKmPrice: 5, perDelayCost: 5, perCostWithDelaySec: 3 * 60)
            self.additionBillingRate = 0.2   // 台中高雄多兩成
        }
        override func countCost(distMeter: Int, delaySec: Int, night: Bool) -> Int {
            return  Int(Double(super.countCost(distMeter, delaySec: delaySec, night: night)) * (nightMode ? (1 + additionBillingRate) : 1))
        }
    }
    func initValueFromText(){
        dist = Int(Double((inputTextDist.text)!)! * 1000)
        delay = Int(Double((inputTextDelay.text)!)! * 60)
        night = switchNightMode.on;
    }
    
    @IBAction func actionCountCostInTpe(sender: AnyObject) {
        initValueFromText()
        
        taipeiTaxi = TaipeiTaxi()
        currentTaxi = taipeiTaxi
        let price = taipeiTaxi.countCost(dist, delaySec: delay, night: night)
        labelCount.text = "\(price)"

    }

    @IBAction func actionCountCostInTaiChung(sender: AnyObject) {

        initValueFromText()
        taichungTaxi = TaichungTaxi()
        currentTaxi = taichungTaxi
        let price = taichungTaxi.countCost(dist, delaySec: delay, night: night)
        labelCount.text = "\(price)"
    
    }

    @IBAction func actionCountCostInKaoSiung(sender: AnyObject) {
        initValueFromText()
        
        kaoshiungTaxi = KaoshiungTaxi()
        currentTaxi = kaoshiungTaxi
        
        let price = kaoshiungTaxi.countCost(dist, delaySec: delay, night: night)
        labelCount.text = "\(price)"

    }
    
    func stateChanged(nightMode: UISwitch) {
        
        labelNightMode.text = nightMode.on ? "ON" : "OFF"
        initValueFromText()
        currentTaxi!.setNightMode(nightMode.on)
        let price = currentTaxi!.countCost(dist , delaySec: delay, night: nightMode.on)
        labelCount.text = "\(price)"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        switchNightMode.addTarget(self, action: Selector("stateChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

