//
//  BookController.swift
//  CodeChallenge2JayMaloney
//
//  Created by Jay Maloney on 4/14/16.
//  Copyright © 2016 Jay Maloney. All rights reserved.
//

import Foundation
import UIKit

class BookController {
    
    static var mainBookArray:[Book] = []
    
    //serialize NSData, instantiate model objects,
    //update image property, append to class-level data source
    static func retrieveBooks(completion:(bookArray: [Book]?) -> Void) {
        
        let url = NetworkController.DataURL()
        NetworkController.dataAtURL(url) { (resultData) in
            
            guard let resultData = resultData
                else {
                    print("No Data")
                    completion(bookArray: nil)
                    return
            }
            
            do {
                let booksAnyObject = try NSJSONSerialization.JSONObjectWithData(resultData, options: NSJSONReadingOptions.AllowFragments)
                
                //parse for correct dictionary
                if let bookJSON = booksAnyObject as? [[String:String]] {
                    
                    //loop through dictionaries and create model objects,
                    //get image from imageURL, append to data source
                    //make asynchronous
                    for bookDictionary in bookJSON {
                        
                        let book = Book(jsonDictionary: bookDictionary)
                        mainBookArray.append(book)
                    }
                    
                    let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                    dispatch_async(dispatch_get_global_queue(priority, 0)) {
                        dispatch_async(dispatch_get_main_queue()) {
                            print("Data retrieval and local packaging success")
                            completion(bookArray: mainBookArray)
                        }
                    }
                    
                    
                } else {
                    dispatch_async(dispatch_get_main_queue()) {
                        print("Data retrieval and local packaging success")
                        completion(bookArray: nil)
                    }
                }
                
                
            } catch {
                dispatch_async(dispatch_get_main_queue()) {
                    print("Data retrieval and local packaging success")
                    completion(bookArray: nil)
                }
            }
        }
    }
    
    
    //get UIImage from imageURL
    static func bookImage(url: String, completion:(image: UIImage?) -> Void) {
        let url = NetworkController.urlForImage(url)
        
        NetworkController.dataAtURL(url) { (resultData) in
            guard let resultData = resultData else {
                print("No Data")
                
                dispatch_async(dispatch_get_main_queue()) {
                    print("image failure")
                    completion(image: nil)
                }
                return
            }
            
            let priority = DISPATCH_QUEUE_PRIORITY_HIGH
            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                dispatch_async(dispatch_get_main_queue()) {
                    print("image success")
                     completion(image: UIImage(data: resultData))
                }
            }
        }
    }
    
}
