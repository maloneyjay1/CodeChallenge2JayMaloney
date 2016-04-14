//
//  Book.swift
//  CodeChallenge2JayMaloney
//
//  Created by Jay Maloney on 4/14/16.
//  Copyright © 2016 Jay Maloney. All rights reserved.
//

import Foundation

class Book {
    
    static let titleKey = "title"
    static let imageURLKey = "imageURL"
    static let authorKey = "author"
    
    let title:String?
    let imageURL:String?
    let author:String?
    
    //    initialize from immediate dictionary
    init(jsonDictionary : [String: String]) {
        self.title = jsonDictionary[Book.titleKey]
        self.imageURL = jsonDictionary[Book.imageURLKey]
        self.author = jsonDictionary[Book.authorKey]
    }
    
}
