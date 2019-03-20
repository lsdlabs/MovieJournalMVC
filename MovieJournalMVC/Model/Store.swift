//
//  Store.swift
//  MovieJournalMVC
//
//  Created by Lauren Small on 3/12/19.
//  Copyright © 2019 Lauren Small. All rights reserved.
//

//import Foundation
//
//class Store {
//    static let shared: Store = Store()
//
//    var movieReviews: [MovieReview]
//
//    private init(){
//        movieReviews = [MovieReview]()
//    }
//}


import Foundation

class Store {
    
    
    static let shared = Store()
    private(set) var entries = [MovieReview]()
    
    func addEntryWith(title: String, review: String) {
        let entry = MovieReview(title: title, review: review)
        entries.append(entry)
    }
    
    
    func remove(entry: MovieReview) {
        if let entryIndex = entries.index(of: entry) {
            entries.remove(at: entryIndex)
        }
    }
    
    
    func update(entry: MovieReview, with title: String, review: String) {
        entry.title = title
        entry.review = review
    }
}

