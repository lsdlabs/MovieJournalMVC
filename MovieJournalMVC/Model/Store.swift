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
    
    /// creates a new instance of MovieReview, and adds it to the entries array
    func addEntryWith(title: String, review: String) {
        let entry = MovieReview(title: title, review: review)
        entries.append(entry)
    }
    
    /// removes the entry from the entries array
    func remove(entry: MovieReview) {
        if let entryIndex = entries.index(of: entry) {
            self.entries.remove(at: entryIndex)
        }
    }
    
    ///takes in an existing entry as a parameter, as well as the title and text strings to update the entry with
    func update(entry: MovieReview, with title: String, review: String) {
        if let index = self.entries.index(of: entry) {
            self.entries[index].title = title
            self.entries[index].review = review
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
        do{
            let data = try Data(contentsOf: fileURL())
            let entries = try decoder.decode([MovieReview].self, from: data)
            self.entries = entries
        } catch {
            print("Error retrieving from persistent storage: \(error)")
        }
    }
    
}
