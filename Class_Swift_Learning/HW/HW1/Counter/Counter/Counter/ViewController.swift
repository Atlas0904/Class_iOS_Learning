//
//  ViewController.swift
//  Counter
//
//  Created by atlas on 2016/3/12.
//  Copyright © 2016年 atlas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0;
    

    @IBOutlet weak var countLabel: UILabel!

    @IBOutlet weak var valueToBeAction: UITextField!
    
    @IBOutlet weak var waringLabel: UILabel!
    
    @IBAction func addByValue(sender: AnyObject) {
        var myInt: Int? = 0
        myInt = Int(valueToBeAction.text!)
        count = count + myInt!
        waringLabel.text = ""
        countLabel.text = "\(count)"
        
    }

    @IBAction func mulBy2Pressed(sender: AnyObject) {
        waringLabel.text = ""
        
        if (count &* 2 < 0) {
            waringLabel.text = "Overflow reset to 1."
            count = 1
        } else {
            count = count&*2
        }
        countLabel.text = "\(count)"
    }

    
    @IBAction func substractOnePressed(sender: AnyObject) {
        count = count-1
        
        waringLabel.text = ""
        countLabel.text = "\(count)"
    }
    
    
    @IBAction func resetPressed(sender: AnyObject) {
        count = 0
        
        waringLabel.text = ""
        countLabel.text = "\(count)"
    }
    
    @IBAction func plusOnePressed(sender: AnyObject) {
        count = count+1
        
        waringLabel.text = ""
        countLabel.text = "\(count)"
    }
/*
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
*/

}

