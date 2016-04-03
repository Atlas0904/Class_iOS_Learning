//
//  Article.swift
//  NewsReader
//
//  Created by Denny Tsai on 3/20/16.
//  Copyright © 2016 hpd.io. All rights reserved.
//

import UIKit

class Article {
    
    var title = ""
    var link = ""
    var image: UIImage? = nil
    var content = ""
    
    init(title: String, link: String, image: UIImage?, content: String) {
        self.title = title
        self.link = link
        self.image = image
        self.content = content
    }

}
