//
//  NetworkController.swift
//  CodeChallenge2JayMaloney
//
//  Created by Jay Maloney on 4/14/16.
//  Copyright © 2016 Jay Maloney. All rights reserved.
//

import Foundation

class NetworkController {
    
    //API URL
    static let baseURL = "http://de-coding-test.s3.amazonaws.com/books.json"
    
    //return NSURL from API string
    static func DataURL() -> NSURL {
        return NSURL(string: baseURL)!
    }
    
    //dataTask with NSURL
    static func dataAtURL(url: NSURL, completion:(resultData: NSData?) -> Void) {
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            
            guard let data = data  else {
                print(error?.localizedDescription)
                completion(resultData: nil)
                return
            }
            
            completion(resultData: data)
        }
        dataTask.resume()
    }
    
    //image with NSURL
    static func urlForImage(url: String) -> NSURL {
        return NSURL(string: url)!
    }
    
}

