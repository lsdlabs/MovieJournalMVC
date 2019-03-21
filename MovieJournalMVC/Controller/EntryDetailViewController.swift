//
//  EntryDetailViewController.swift
//  MovieJournalMVC
//
//  Created by Lauren Small on 3/19/19.
//  Copyright © 2019 Lauren Small. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var reviewTextView: UITextView!
    
    
    var entry: MovieReview? {
        didSet {
            if isViewLoaded { updateViews() }
        }
    }
    
    ///calls update views
    override func viewDidLoad() {
        super.viewDidLoad()
//        titleTextField.delegate = self
            updateViews()
    }
    
    ///Checks if the optional entry property holds an entry. If it does, the function updates all view elements that reflect details about the model object movieReview (in this case, the titleTextField and reviewTextView)
    ///will update the destination view controller with the entry details
    private func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        reviewTextView.text = entry.review
    }
    
    /// checks if the optional entry property holds an entry and if it does, it calls the update(entry: ...) function in the Store to update the properties of the entry. If not, it calls the add(entry: MovieReview) function on the Store. After adding a new entry, or updating the existing entry, it dismisses the current view.
    @IBAction func userTappedSave(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text, let text = reviewTextView.text else { return }
        
        if let entry = self.entry {
            Store.shared.update(entry: entry, with: title, review: text)
            print("updated entry")
        } else {
            Store.shared.addEntryWith(title: title, review: text)
            print("added entry")
        }
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    ///calls the resignFirstResponder() method on the titleTextField to dismiss the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
