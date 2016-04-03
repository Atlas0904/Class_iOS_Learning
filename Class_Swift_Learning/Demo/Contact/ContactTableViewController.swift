//
//  ContactTableViewController.swift
//  Contact
//
//  Created by atlas on 2016/3/19.
//  Copyright © 2016年 atlas. All rights reserved.
//

import UIKit

class ContactTableViewController: UITableViewController {
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
        let cell = tableView.dequeueReusableCellWithIdentifier("NameCell", forIndexPath: indexPath) as! ContactTableViewCell
        
        cell.contactLabel.text = info["name"]
        
        return cell
    }
}
