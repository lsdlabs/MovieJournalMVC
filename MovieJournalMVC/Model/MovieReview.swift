//
//  MovieReview.swift
//  MovieJournalMVC
//
//  Created by Lauren Small on 3/12/19.
//  Copyright © 2019 Lauren Small. All rights reserved.
//

import Foundation

class MovieReview: Equatable, Codable {
    
    static func == (lhs: MovieReview, rhs: MovieReview) -> Bool {
        return true
    }
    
    var title: String
    var review: String
    
    
    init(title: String, review: String) {
        
        self.title = title
        self.review = review
    }
}



