//
//  ContentViewController.swift
//  stronghold-macOS
//
//  Created by Ethan Winters on 11/29/18.
//  Copyright © 2018 Aaron Lichtman. All rights reserved.
//

import Cocoa

class ContentViewController: NSViewController, NSCollectionViewDelegate, NSCollectionViewDataSource {
    @IBOutlet weak var label: NSTextField!
    @IBOutlet weak var collectionView: NSCollectionView!
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = NSNib(nibNamed: NSNib.Name(rawValue: "CollectionViewItem"), bundle: nil)
        collectionView!.register(item, forItemWithIdentifier: .collectionViewItem)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    func updateLabel(newText: String) {
        text = newText
        label.stringValue = newText
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: .collectionViewItem, for: indexPath)
        item.textField?.stringValue = text
        return item
    }
}

extension NSUserInterfaceItemIdentifier {
    static let collectionViewItem = NSUserInterfaceItemIdentifier("CollectionViewItem")
}
