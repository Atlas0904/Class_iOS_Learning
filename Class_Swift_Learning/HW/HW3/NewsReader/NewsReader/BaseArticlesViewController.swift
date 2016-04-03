//
//  BaseArticlesViewController.swift
//  NewsReader
//
//  Created by Denny Tsai on 3/20/16.
//  Copyright © 2016 hpd.io. All rights reserved.
//

import UIKit
import Firebase
import Haneke

class BaseArticlesViewController: UITableViewController {
    
    var articles = [Article]()
    let articlesRef = Firebase(url: "https://iosdev-hpd.firebaseio.com/NewsReader/articles")
    
    var articlesTotalCount = 0
    var articlesLoaded = 0
    
    override func viewDidLoad() {
        articlesRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
            if snapshot.value is NSNull {
                return
            }
            
            let raw_articles = snapshot.value as! NSDictionary
            self.articlesTotalCount = raw_articles.count
            self.articlesLoaded = 0
            
            for (_, raw_article) in raw_articles {
                let raw_article = raw_article as! NSDictionary
                
                if let imageUrl = raw_article["imageUrl"] as? String {
                    let cache = Shared.imageCache
                    let url = NSURL(string: imageUrl)!
                    let fetcher = NetworkFetcher<UIImage>(URL: url)
                    
                    cache.fetch(fetcher: fetcher).onSuccess { image in
                        self.createArticle(raw_article, image: image)
                    }
                } else {
                    self.createArticle(raw_article, image: nil)
                }
            }
        })
    }
    
    func foo() -> Int {
        struct Holder {
            static var timesCalled = 0
        }
        return ++Holder.timesCalled;
    }
    
    func createArticle(raw_article: NSDictionary, image: UIImage?) {
        let title = raw_article["title"] as! String
        let link = raw_article["link"] as! String
        let content = raw_article["content"] as! String
        
        let article = Article(title: title, link: link, image: image, content: content)
        
//        if (foo() <= 3) {
//            print("==== Debug ====")
//            print(article.title)
//            print(article.link)
//            print(article.content)
//        }

        articles.append(article)
//        print("createArticle articlesLoaded: " + String(articlesLoaded))
//        print("createArticle articlesTotalCount: " + String(articlesTotalCount))
        articlesLoaded += 1
        
        if articlesLoaded == articlesTotalCount {
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
                return
            }
        }
        
    }
    
    

}
