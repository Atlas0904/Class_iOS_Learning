//
//  ContentViewController.swift
//  NewsReader
//
//  Created by atlas on 2016/3/22.
//  Copyright © 2016年 hpd.io. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    var newsTitle = ""
    var newsContent = ""
    var newsImage: UIImage?

    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsContentLabel: UILabel!
    
    @IBOutlet weak var newsImageView: UIImageView!

    
    override func viewWillAppear(animated: Bool) {   // 用這個確定會 show
        super.viewWillAppear(animated)
        newsTitleLabel.text = newsTitle
        newsContentLabel.text = newsContent
        newsImageView.image = newsImage

    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        newsContentLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
//        newsContentLabel.numberOfLines = 0
//    }

}
