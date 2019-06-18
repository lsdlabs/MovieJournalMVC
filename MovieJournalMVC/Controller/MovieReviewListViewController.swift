//
//  MasterViewController.swift
//  MovieJournalMVC
//
//  Created by Lauren Small on 3/12/19.
//  Copyright © 2019 Lauren Small. All rights reserved.
//

import UIKit

class MovieReviewListViewController: UITableViewController {
    // MARK: Lifecycle
    
    var reviews: [MovieReview] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.reviews = Store.shared.entries
        NotificationCenter.default.addObserver(self, selector: #selector(self.movieChanged), name: Store.Notifications.movieWasChanged, object: nil)
    }
    
    @objc func movieChanged(note: Notification) {
        self.reviews = Store.shared.entries
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    // MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identString = segue.identifier, let identifier = SegueIndentifier(rawValue: identString) else {
            return
        }
        
        // switch to guards
        switch identifier {
        case .showEntry:
            if let detailViewController = segue.destination as? EntryDetailViewController,
                let selectedRow = tableView.indexPathForSelectedRow?.row {
                // let entry = Store.shared.entries[selectedRow]
                let entry = self.reviews[selectedRow]
                detailViewController.entry = entry
            }
        }
    }
    
    // MARK: UITableViewDataSource/Delegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return Store.shared.entries.count
        return self.reviews.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieReviewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieReviewCell
        // let entry = Store.shared.entries[indexPath.row]
        let entry = self.reviews[indexPath.row]
        cell.setup(using: entry)
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// enables swipe to delete functionality
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let movieStore = Store.shared
            let entry = movieStore.entries[indexPath.row]
            movieStore.remove(entry: entry)
            
//            // Delete the row from the table view
//            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
