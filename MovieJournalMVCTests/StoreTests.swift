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
        let store = Store(fileManager: TestFileManager())
//        let movieReviewEntry = MovieReviewEntry(title: "The Dark Knight", review: "Good Movie")
        
        // When
        let initialCount = store.entries.count
        store.addEntryWith(title: "Hello", review: "World")
        
        // Then
        XCTAssertEqual(store.entries.count, 1)
        XCTAssertEqual(initialCount, 0)
    }
    
    func testRemovingEntry() {
        let store = Store(fileManager: TestFileManager())
        
        let movieReviewEntry = MovieReview(title: "The Dark Knight", review: "Good Movie")
        
        // store.addEntryWith(title: "Hello", review: "World")
        store.add(movieReviewEntry)
        let countAfterAdd = store.entries.count
        store.remove(entry: movieReviewEntry)
        let countAfterRemove = store.entries.count
        XCTAssertEqual(countAfterAdd, 1)
        XCTAssertEqual(countAfterRemove, 0)
    }
}

class TestFileManager: FileManageable {
    let path: String
    var writtenData: Data?
    let failWrite: Bool
    let failRead: Bool
    
    init(path: String = "", failWrite: Bool = false, failRead: Bool = false) {
        self.path = path
        self.failWrite = failWrite
        self.failRead = failRead
    }
    
    var documentsDirectory: URL { return URL(fileURLWithPath: path) }
    
    func write(_ data: Data, to url: URL) throws {
        if failWrite {
            // Throw an error
        } else {
            writtenData = data
        }
    }
    
    func read(from url: URL) throws -> Data {
        if failRead {
            throw FileError.couldNotFindFile
        } else {
            return writtenData ?? Data()
        }
    }
}

// class FailingFileManager: FileManageable {
////    var documentsDirectory: URL
//
//    // any URL would work
//    func write(_ data: Data, to url: URL) throws {
//        throw FileError.couldNotWriteFileToDisk
//    }
//
////    func read(from url: URL) throws -> Data {
////        <#code#>
////    }
// }
//
// class WorkingFileManager: FileManageable {
//    func write(_ data: Data, to url: URL) throws {}
//    func read(from url: URL) throws -> Data { return Data() }
// }
