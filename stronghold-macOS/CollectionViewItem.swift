//
//  CollectionViewItem.swift
//  stronghold-macOS
//
//  Created by Ethan Winters on 11/30/18.
//  Copyright © 2018 Aaron Lichtman. All rights reserved.
//

import Cocoa

class CollectionViewItem: NSCollectionViewItem {
    @IBOutlet weak var label: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
