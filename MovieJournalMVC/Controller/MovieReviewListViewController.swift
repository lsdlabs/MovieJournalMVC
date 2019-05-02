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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identString = segue.identifier, let identifier = SegueIndentifier(rawValue: identString) else {
            return
        }
        
        switch identifier {
        case .showEntry:
            if let detailViewController = segue.destination as? EntryDetailViewController,
                let selectedRow = tableView.indexPathForSelectedRow?.row {
                let entry = Store.shared.entries[selectedRow]
                detailViewController.entry = entry
            }
        }
    }
    
    // MARK: UITableViewDataSource/Delegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Store.shared.entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieReviewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieReviewCell
        let entry = Store.shared.entries[indexPath.row]
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
            
//            Notifications or KVO?
//            unidirectional data flow!
            
            // Delete the row from the table view
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
/*
 Notifications or KVO?
 unidirectional data flow!
 */
