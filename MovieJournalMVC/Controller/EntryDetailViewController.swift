//
//  EntryDetailViewController.swift
//  MovieJournalMVC
//
//  Created by Lauren Small on 3/19/19.
//  Copyright © 2019 Lauren Small. All rights reserved.
//

import UIKit

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        updateViews()
    }
    
    // MARK: Actions
    
    //    @IBAction func saveButtonTapped(_ sender: Any) {
    //
    //        guard let title = titleTextField.text, let text = bodyTextView.text else { return }
    //
    //        if let entry = self.entry {
    //            EntryController.shared.update(entry: entry, with: title, text: text)
    //        } else {
    //            EntryController.shared.addEntryWith(title: title, text: text)
    //        }
    //
    //        let _ = self.navigationController?.popViewController(animated: true)
    //    }
    //
    //    @IBAction func clearButtonTapped(_ sender: Any) {
    //
    //        titleTextField.text = ""
    //        bodyTextView.text = ""
    //    }
    //
    //    // MARK: Private
    //
    //    private func updateViews() {
    //        guard let entry = entry else { return }
    //        titleTextField.text = entry.title
    //        bodyTextView.text = entry.text
    //    }
    //
    //    // MARK: UITextFieldDelegate
    //
    //    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //
    //        textField.resignFirstResponder()
    //
    //        return true
    //    }
    //
    //    // MARK: Properties
    //
    //    var entry: Entry? {
    //        didSet {
    //            if isViewLoaded { updateViews() }
    //        }
    //    }
    //
    //    @IBOutlet weak var titleTextField: UITextField!
    //    @IBOutlet weak var bodyTextView: UITextView!
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
