//
//  ViewController.swift
//  CodeChallenge2JayMaloney
//
//  Created by Jay Maloney on 4/14/16.
//  Copyright © 2016 Jay Maloney. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var books:[Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        BookController.retrieveBooks(didLoadData)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //During this second try I called my retrieval function in viewDidLoad and completed with a class level view function to test the overall structure.
    func didLoadData(bookArray:[Book]?) {
        
        if let books = bookArray {
            
            let book2 = books[1]
            
            if let title = book2.title {
                print("\(title)")
            }
            
            if let url = book2.imageURL {
                BookController.bookImage(url, completion: didGetUIImage)
            }
        }
    }
    
    
    func didGetUIImage(image:UIImage?) {
        if let image = image {
            print(image)
        }
    }
    
}

