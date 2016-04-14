//
//  BookDetailViewController.swift
//  CodeChallenge2JayMaloney
//
//  Created by Jay Maloney on 4/14/16.
//  Copyright © 2016 Jay Maloney. All rights reserved.
//

import UIKit

//Detail view will present a larger image, title and author if present in book
class BookDetailViewController: UIViewController {
    
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //update view properties with book from previous indexPath.row
    func updateWithBook(book:Book) {
        if let title = book.title {
            self.bookTitle.text = title
        } else {
            self.bookTitle.text = ""
        }
        
        if let bookAuthor = book.author {
             self.author.text = bookAuthor
        } else {
            self.author.text = ""
        }
        
        if let url = book.imageURL {
            let priority = DISPATCH_QUEUE_PRIORITY_HIGH
            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                dispatch_async(dispatch_get_main_queue()) {
                    print("image loaded")
                    BookController.bookImage(url, completion: { (image) in
                        if let bookImage = image {
                            self.image.image = bookImage
                            self.image.contentMode = UIViewContentMode.ScaleAspectFit
                        }
                    })
                }
            }
        } else {
            image.image = UIImage()
        }
    }
    
    
}
