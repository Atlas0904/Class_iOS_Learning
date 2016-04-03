//
//  NameViewController.swift
//  People
//
//  Created by Denny Tsai on 3/19/16.
//  Copyright © 2016 hpd.io. All rights reserved.
//

import UIKit

class NameViewController: UITableViewController {

    var contacts = [
        ["name": "王小明", "phone": "0988283829", "email": "hello@world.com"],
        ["name": "小華", "phone": "23456789", "email": "hmm@nono.com"],
        ["name": "賈伯斯", "phone": "1234555555", "email": "jobs@apple.com"],
    ]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let info = contacts[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("NameCell", forIndexPath: indexPath) as! NameCell
        
        cell.nameLabel.text = info["name"]
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Segue way 會來叫, send 誰觸發 segue
        if let idenfifier = segue.identifier {
            if idenfifier == "showinfo" {
                let cell = sender as! NameCell
                let indexPath = tableView.indexPathForCell(cell)!   //一定按得到
                let info = contacts[indexPath.row]
                
                let infoVC = segue.destinationViewController as! infoViewController
                infoVC.name = info["name"]!   // 確定不是 nil
                infoVC.email = info ["email"]!   // 傳遞資料就好 不用改
                infoVC.phone =  info ["phone"]!

            }
        }
    }
    
}
