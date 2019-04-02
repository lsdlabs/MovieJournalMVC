//
//  Store.swift
//  MovieJournalMVC
//
//  Created by Lauren Small on 3/12/19.
//  Copyright © 2019 Lauren Small. All rights reserved.
//

import Foundation

class Store {
    
    
    static let shared = Store()
    private(set) var entries = [MovieReview]()
    
    
    ///creates a new instance of MovieReview, and adds it to the entries array
    func addEntryWith(title: String, review: String) {
        let entry = MovieReview(title: title, review: review)
        entries.append(entry)
    }
    
    
    
    ///removes the entry from the entries array
    func remove(entry: MovieReview) {
        if let entryIndex = entries.index(of: entry) {
            entries.remove(at: entryIndex)
        }
    }
    
    
    
    ///takes in an existing entry as a parameter, as well as the title and text strings to update the entry with
    func update(entry: MovieReview, with title: String, review: String) {
        if let index = self.entries.index(of: entry) {
            self.entries[index].title = title
            self.entries[index].review = review
        }
        
    }
    
//    func update(entry: MovieReview, with title: String, review: String) {
//
//        var entry = entry
//
//        entry.title = title
//        entry.review = review
//    }
}

