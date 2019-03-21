////
////  MasterViewController.swift
////  MovieJournalMVC
////
////  Created by Lauren Small on 3/12/19.
////  Copyright © 2019 Lauren Small. All rights reserved.
////
//
//import UIKit
//
//class MasterViewController: UITableViewController {
//
//    var detailViewController: DetailViewController? = nil
//    var objects = Store.shared.movieReviews
//    var count = 0 //TODO: delete this variable and its later usage post-testing
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        navigationItem.leftBarButtonItem = editButtonItem
//
//        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
//        navigationItem.rightBarButtonItem = addButton
//        if let split = splitViewController {
//            let controllers = split.viewControllers
//            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
//        }
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
//        super.viewWillAppear(animated)
//    }
//
//    @objc
//    func insertNewObject(_ sender: Any) {
//
//        let newReview = MovieReview(title: "Movie #\(count)", review: "Desctiption for Movie #\(count)")
//
//        count += 1
//
//        objects.insert(newReview, at: 0)
//        let indexPath = IndexPath(row: 0, section: 0)
//        tableView.insertRows(at: [indexPath], with: .automatic)
//    }
//
//    // MARK: - Segues
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showDetail" {
//            if let indexPath = tableView.indexPathForSelectedRow {
//                let object = objects[indexPath.row]
//                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
//                controller.detailItem = object
//                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
//                controller.navigationItem.leftItemsSupplementBackButton = true
//            }
//        }
//    }
//
//    // MARK: - Table View
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return objects.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieReviewCell
//
//        let object = objects[indexPath.row]
//        //cell.textLabel!.text = object.description
//        cell.movieTitleLabel.text! = object.title
//
//        cell.title = object.title
//        cell.review = object.review
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            objects.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//        }
//    }
//
//
//}
//



//
//  MasterViewController.swift
//  MovieJournalMVC
//
//  Created by Lauren Small on 3/12/19.
//  Copyright © 2019 Lauren Small. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.reloadData()
//        }
    
    
    ///////
    
    
//    var detailViewController: EntryDetailViewController? = nil
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            // Do any additional setup after loading the view, typically from a nib.
//            navigationItem.leftBarButtonItem = editButtonItem
//
//            let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
//            navigationItem.rightBarButtonItem = addButton
//            if let split = splitViewController {
//                let controllers = split.viewControllers
//                detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? EntryDetailViewController
//            }
//        }
//
//
//        @objc
//        func insertNewObject(_ sender: Any) {
//            let indexPath = IndexPath(row: 0, section: 0)
//            tableView.insertRows(at: [indexPath], with: .automatic)
//        }
//
//
    


    ////////
    
    
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
    
    
//        override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//            // Return false if you do not want the specified item to be editable.
//            return true
//        }
        
    
    
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
//        super.viewWillAppear(animated)
//    }


    
    // MARK: - Segues
    

    

    


    


