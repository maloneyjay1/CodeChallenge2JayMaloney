//
//  BookListTableViewController.swift
//  CodeChallenge2JayMaloney
//
//  Created by Jay Maloney on 4/14/16.
//  Copyright © 2016 Jay Maloney. All rights reserved.
//

import UIKit

//List presents a table view of available books, with image and title.  Clicking will segue to detail.
class BookListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BookController.mainBookArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("bookCell", forIndexPath: indexPath)

        let book = BookController.mainBookArray[indexPath.row]
        
        if let bookTitle = book.title {
            cell.textLabel?.text = bookTitle
            cell.textLabel?.font.fontWithSize(8)
        }
        
        if let url = book.imageURL {
            BookController.bookImage(url, completion: { (image) in
                if let bookImage = image {
                    cell.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
                    cell.imageView?.image = bookImage
                    
                    tableView.reloadData()
                }
            })
        }

        return cell
    }

    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDetail" {
            
            if let detailViewController = segue.destinationViewController as? BookDetailViewController {
                
                _ = detailViewController.view
                
                let indexPath = tableView.indexPathForSelectedRow
                
                if let selectedRow = indexPath?.row {
                    let book = BookController.mainBookArray[selectedRow]
                    detailViewController.updateWithBook(book)
                }
            }
        }
    }
    

}
