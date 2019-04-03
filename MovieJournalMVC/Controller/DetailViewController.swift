//
//  DetailViewController.swift
//  MovieJournalMVC
//
//  Created by Lauren Small on 3/12/19.
//  Copyright © 2019 Lauren Small. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var detailDescriptionLabel: UILabel!
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieReviewLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = movieTitleLabel {
                label.text = detail.title
            }
            if let label = movieReviewLabel {
                label.text = detail.review
            }
        }
    }

    var detailItem: MovieReview? {
        didSet {
            // Update the view.
            configureView()
        }
    }
}
