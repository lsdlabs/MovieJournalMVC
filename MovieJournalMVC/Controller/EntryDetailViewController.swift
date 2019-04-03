//
//  EntryDetailViewController.swift
//  MovieJournalMVC
//
//  Created by Lauren Small on 3/19/19.
//  Copyright © 2019 Lauren Small. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    // MARK: Properties
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var reviewTextView: UITextView!
    
    var entry: MovieReview? {
        didSet {
            if isViewLoaded { updateViews() }
        }
    }
    
    // MARK: Lifecycle
    
    /// calls update views
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: Methods
    
    /// Checks if the optional entry property holds an entry. If it does, the function updates all view elements that reflect details about the model object movieReview (in this case, the titleTextField and reviewTextView)
    /// Will update the destination view controller with the entry details
    private func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        reviewTextView.text = entry.review
    }
    
    // MARK: Actions
    
    /// checks if the optional entry property holds an entry and if it does, it calls the update(entry: ...) function in the Store to update the properties of the entry. If not, it calls the add(entry: MovieReview) function on the Store. After adding a new entry, or updating the existing entry, it dismisses the current view.
    @IBAction func userTappedSave(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text, let text = reviewTextView.text else { return }
        
        if let entry = self.entry {
            Store.shared.update(entry: entry, with: title, review: text)
        } else {
            Store.shared.addEntryWith(title: title, review: text)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    // MARK: UITextFieldDelegate
    
    /// Calls the resignFirstResponder() method on the titleTextField to dismiss the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
