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
    private(set) var entries = [MovieReview]() {
        didSet {
            saveToStorage()
        }
    }
    
    struct Notifications {
        static let movieWasChanged = Notification.Name("movieWasChanged")
        
    }
    
    private let fileManager: FileManageable
    
    init(fileManager: FileManageable = FileManager.default) {
        self.fileManager = fileManager
        loadFromStorage()
    }
    
    /// creates a new instance of MovieReview, and adds it to the entries array
    func addEntryWith(title: String, review: String) {
        let entry = MovieReview(title: title, review: review)
        //entries.append(entry)
        self.add(entry)
    }
    
    func add(_ review: MovieReview) {
        entries.append(review)
        NotificationCenter.default.post(name: Notifications.movieWasChanged, object: review)
    }
    
    /// removes the entry from the entries array
    func remove(entry: MovieReview) {
        if let entryIndex = entries.index(of: entry) {
            entries.remove(at: entryIndex)
            NotificationCenter.default.post(name: Notifications.movieWasChanged, object: entry)
        }
    }
    
    ///takes in an existing entry as a parameter, as well as the title and text strings to update the entry with
    func update(entry: MovieReview, with title: String, review: String) {
        if let index = entries.index(of: entry) {
            entries[index].title = title
            entries[index].review = review
            
            NotificationCenter.default.post(name: Notifications.movieWasChanged, object: entries[index])
        }
    }
    
    // MARK: - Persistence
    
    var fileName = "moviejournal.json"
    
    func loadFromStorage() {
        let decoder = JSONDecoder()
        do {
            let data = try fileManager.read(fromFile: fileName)
            let movieReviewEntries = try decoder.decode([MovieReview].self, from: data)
            entries = movieReviewEntries
        } catch {
            print("Error retrieving from persistent storage: \(error)")
        }
    }
    
    func saveToStorage() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(entries)
            try fileManager.write(data, toFile: fileName)
        } catch {
            print("Error saving to persistent storage: \(error)")
        }
    }
}

protocol FileManageable {
    var documentsDirectory: URL { get }
    
    func write(_ data: Data, to url: URL) throws
    func read(from url: URL) throws -> Data
}

extension FileManager: FileManageable {
    var documentsDirectory: URL {
        return urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    func write(_ data: Data, to url: URL) throws {
//        let success = createFile(atPath: url.absoluteString, contents: data, attributes: nil)
        
        let success = createFile(atPath: url.path, contents: data, attributes: nil)
        if !success { throw FileError.couldNotWriteFileToDisk }
    }
    
    func read(from url: URL) throws -> Data {
//        guard let contents = contents(atPath: url.absoluteString) else {
        guard let contents = contents(atPath: url.path) else {
            throw FileError.couldNotFindFile
        }
        
        return contents
    }
}

enum FileError: Error {
    case couldNotWriteFileToDisk
    case couldNotFindFile
}

extension FileManageable {
    func write(_ data: Data, toFile fileName: String) throws {
        try write(data, to: documentsDirectory.appendingPathComponent(fileName))
    }
    
    func read(fromFile fileName: String) throws -> Data {
        return try read(from: documentsDirectory.appendingPathComponent(fileName))
    }
}
