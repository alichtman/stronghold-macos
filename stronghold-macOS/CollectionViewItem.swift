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
        view.wantsLayer = true
        let backgroundColor = NSColor(calibratedHue: 0.675, saturation: 0.44, brightness: 0.78, alpha: 0.4)
        view.layer?.backgroundColor = backgroundColor.cgColor
//        view.layer?.borderColor = CGColor.black
//        view.layer?.borderWidth = 0.5
        view.layer?.cornerRadius = 5
    }
    
}
