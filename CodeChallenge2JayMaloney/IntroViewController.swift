//
//  IntroViewController.swift
//  CodeChallenge2JayMaloney
//
//  Created by Jay Maloney on 4/14/16.
//  Copyright © 2016 Jay Maloney. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    
    var books:[Book] = []
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Activity indicator to show that data is loading.  While retrieval is active, the user can't progress in UI, ensuring that the app will work as intended visually.
        self.activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 100, 100))
        self.activityIndicator.center = self.view.center
        self.activityIndicator.hidesWhenStopped = true
        self.activityIndicator.activityIndicatorViewStyle = .Gray
        self.view.addSubview(self.activityIndicator)
        self.activityIndicator.startAnimating()
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        BookController.retrieveBooks(didLoadData)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //During this second try I called my retrieval function in viewDidLoad
    //and completed with a class level view function to test the overall structure.
    func didLoadData(bookArray:[Book]?) {
        if let books = bookArray {
            if books.count == 2000 {
                
                //if data is complete, allow user to proceed
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                print("data ready to use")
            }
        }
    }
    
    
    func didGetUIImage(image:UIImage?) {
        if let image = image {
            print(image)
        }
    }
    
}
