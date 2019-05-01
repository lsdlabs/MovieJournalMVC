//
//  StoreTests.swift
//  MovieJournalMVCTests
//
//  Created by Lauren Small on 4/17/19.
//  Copyright © 2019 Lauren Small. All rights reserved.
//

import Foundation
@testable import MovieJournalMVC
import XCTest

class StoreTests: XCTestCase {
//    func testAddingEntry() {
//        let title = "The Dark Knight"
//        let review = "good movie"
//    }
    
    func testAddingEntry() {
        // Given
        let store = Store(fileManageable: FailingFileManager())
//        let movieReviewEntry = MovieReviewEntry(title: "The Dark Knight", review: "Good Movie")
        let initialCount = store.entries.count
        
        XCTAssertTrue(store.entries.count == 0)
        
        // When
        store.addEntryWith(title: "Hello", review: "World")
        
        // Then
        XCTAssertTrue(store.entries.count == 1)
        XCTAssertEqual(initialCount, 0)
        
        
        
    }
    
    func testRemovingEntry() {
        let store = Store(fileManageable: FailingFileManager())
        
        
        let movieReviewEntry = MovieReview(title: "The Dark Knight", review: "Good Movie")
        
        //store.addEntryWith(title: "Hello", review: "World")
        store.addEntryWith(title: movieReviewEntry.title, review: movieReviewEntry.review)
        XCTAssertTrue(store.entries.count > 0)
        
        
        store.remove(entry: movieReviewEntry)
        XCTAssertTrue(store.entries.count < 3)
    }
    

}


//class TestFileManager: FileManageable {
//    var documentsDirectory: URL
//
//
//    //any URL would work
//    func write(_ data: Data, to url: URL) throws {
//        throw FileError.couldNotWriteFileToDisk
//    }
//
//    func read(from url: URL) throws -> Data? {
//        <#code#>
//    }
//
//
//}


class FailingFileManager: FileManageable {
//    var documentsDirectory: URL
    
    //any URL would work
    func write(_ data: Data, to url: URL) throws {
        throw FileError.couldNotWriteFileToDisk
    }
    
//    func read(from url: URL) throws -> Data {
//        <#code#>
//    }
    
    
}

class WorkingFileManager: FileManageable {
    func write(_ data: Data, to url: URL) throws { }
    func read(from url: URL) throws -> Data { return Data() }
    
}
