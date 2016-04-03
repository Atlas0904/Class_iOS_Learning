//
//  ArticleCell.swift
//  NewsReader
//
//  Created by atlas on 2016/3/21.
//  Copyright © 2016年 hpd.io. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var titleBarLabel: UILabel!
    @IBOutlet weak var titleBarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
