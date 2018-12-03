//
//  SplitViewController.swift
//  stronghold-macOS
//
//  Created by Ethan Winters on 11/29/18.
//  Copyright © 2018 Aaron Lichtman. All rights reserved.
//

import Cocoa

class SplitViewController: NSSplitViewController {
    @IBOutlet weak var mainView: NSSplitViewItem!
    @IBOutlet weak var contentView: NSSplitViewItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let leftVC = mainView.viewController as? MainViewController {
            if let rightVC = contentView.viewController as? ContentViewController {
                leftVC.contentVC = rightVC
            }
        }
    }
    
}
