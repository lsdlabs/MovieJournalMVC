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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        titleTextField.delegate = self
            updateViews()
    }
    
    
    private func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        reviewTextView.text = entry.review
    }
    
    
    @IBAction func userTappedSave(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text, let text = reviewTextView.text else { return }
        
        if let entry = self.entry {
            Store.shared.update(entry: entry, with: title, review: text)
        } else {
            Store.shared.addEntryWith(title: title, review: text)
        }
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
