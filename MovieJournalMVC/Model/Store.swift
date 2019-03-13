//
//  Store.swift
//  MovieJournalMVC
//
//  Created by Lauren Small on 3/12/19.
//  Copyright © 2019 Lauren Small. All rights reserved.
//

import Foundation

class Store {
    static let shared: Store = Store()
    
    var movieReviews: [MovieReview]
    
    private init(){
        movieReviews = [MovieReview]()
    }
}
