//
//  ArticlesViewController.swift
//  NewsReader
//
//  Created by Denny Tsai on 3/20/16.
//  Copyright © 2016 hpd.io. All rights reserved.
//

import UIKit

class ArticlesViewController: BaseArticlesViewController {

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("tableView: articlesTotalCount= " + String(articlesTotalCount));
        return articlesTotalCount
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
            let article = articles[indexPath.row]
            let cell = tableView.dequeueReusableCellWithIdentifier("ArticleCell", forIndexPath: indexPath) as! ArticleCell
        
            cell.titleBarLabel.text = article.title
            cell.titleBarImage.image = article.image
            print("article= " + String(article.title))
            return cell

    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "displayContent" {
                let cell = sender as! ArticleCell
                let indexPath = tableView.indexPathForCell(cell)!
                let info = articles[indexPath.row]
                
                let contentVC = segue.destinationViewController as! ContentViewController
                contentVC.newsTitle = info.title
                contentVC.newsContent = info.content
                contentVC.newsImage = info.image
            }
        }
    }

    
}
