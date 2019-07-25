//
//  DetailedPageViewController.swift
//  ArcSin_TestApp
//
//  Created by Niko on 7/25/19.
//  Copyright © 2019 Niko. All rights reserved.
//

import Foundation
import UIKit

class DetailedPageViewController: UIViewController {
    
    var user: User?
    
    private var scrollView: UIScrollView!
    private var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        self.label.text = self.user?.description
    }
    
    func configureView() {
        self.scrollView = UIScrollView()
        self.view.addSubview(scrollView)
        self.view.backgroundColor = UIColor.white
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.fillSuperView()
        
        self.label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        label.numberOfLines = 0
        label
            .top(to: scrollView.topAnchor, constant: 12)
            .leading(to: scrollView.leadingAnchor, constant: 12)
            .trailing(to: scrollView.trailingAnchor, constant: 12)
            .bottom(to: scrollView.bottomAnchor, constant: 12)

        
    }
}
