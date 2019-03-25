//
//  MasterViewController.swift
//  MovieJournalMVC
//
//  Created by Lauren Small on 3/12/19.
//  Copyright © 2019 Lauren Small. All rights reserved.
//

import UIKit

class MovieReviewListViewController: UITableViewController {
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showEntry" {
            
            if let detailViewController = segue.destination as? EntryDetailViewController,
                let selectedRow = tableView.indexPathForSelectedRow?.row {
                
                let entry = Store.shared.entries[selectedRow]
                detailViewController.entry = entry
            }
        }
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Store.shared.entries.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let entry = Store.shared.entries[indexPath.row]
        cell.textLabel?.text = entry.title
        
        return cell
    }
    
    
    
    ///enables swipe to delete functionality
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let movieStore = Store.shared
            let entry = movieStore.entries[indexPath.row]
            movieStore.remove(entry: entry)
            
            // Delete the row from the table view
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

