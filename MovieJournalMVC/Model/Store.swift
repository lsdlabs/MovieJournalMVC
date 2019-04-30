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
    
    init() {
        self.loadFromStorage()
    }
    
    /// creates a new instance of MovieReview, and adds it to the entries array
    func addEntryWith(title: String, review: String) {
        let entry = MovieReview(title: title, review: review)
        entries.append(entry)
        saveToStorage()
    }
    
    /// removes the entry from the entries array
    func remove(entry: MovieReview) {
        if let entryIndex = entries.index(of: entry) {
            self.entries.remove(at: entryIndex)
            self.saveToStorage()
        }
    }
    
    ///takes in an existing entry as a parameter, as well as the title and text strings to update the entry with
    func update(entry: MovieReview, with title: String, review: String) {
        if let index = self.entries.index(of: entry) {
            self.entries[index].title = title
            self.entries[index].review = review
            self.saveToStorage()
        }
    }
    
    // MARK: - Persistence
    
    func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "moviejournal.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    func loadFromStorage() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let movieReviewEntries = try decoder.decode([MovieReview].self, from: data)
            self.entries = movieReviewEntries
        } catch {
            print("Error retrieving from persistent storage: \(error)")
        }
    }
    
    func saveToStorage() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(entries)
            try data.write(to: fileURL())
        } catch {
            print("Error saving to persistent storage: \(error)")
        }
    }
}


protocol FileManageable {
    var documentsDirectory: URL { get }
    
    func write(_ data: Data, to url: URL) throws
    func read(from url: URL) throws -> Data?
}


enum FileError: Error {
    case couldNotWriteFileToDisk
    case couldNotFindFile
}


extension FileManager: FileManageable {
    var documentsDirectory: URL {
        return urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    
    
    func write(_ data: Data, to url: URL) throws {
        do {
            //try documentsDirectory.write(to: url, atomically: false, encoding: .utf8)
            try data.write(to: url, options: .atomic)
        } catch {
            throw FileError.couldNotWriteFileToDisk
            //print(error)
        }
    }
    
    func read(from url: URL) throws -> Data? { //make non-optional data (ignore the error that comes back?)
        guard let data = try? Data(contentsOf: url) else {
            print("Error")
            // return or break
            return nil
        }
        // do something with data
        return data
    }
    
    // return try String(contentsOf: url, encoding: .utf8)
    /*
     do {
         return try Data(contentsOf: url)
     } catch {
         print(error)
     }
     */
}
