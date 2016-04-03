//
//  infoViewController.swift
//  People
//
//  Created by atlas on 2016/3/20.
//  Copyright © 2016年 hpd.io. All rights reserved.
//

import UIKit

class infoViewController: UIViewController {

    
    var name = ""
    var email = ""
    var phone = ""
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {   // 用這個確定會 show
        super.viewWillAppear(animated)
        nameLabel.text = name
        emailLabel.text = email
        phoneLabel.text = phone
    }

}
