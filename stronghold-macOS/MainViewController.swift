//
//  MainViewController.swift
//  stronghold-macOS
//
//  Created by Aaron Lichtman on 7/16/18.
//  Copyright © 2018 Aaron Lichtman. All rights reserved.
//

// Acknowledgements to: https://github.com/lukakerr/swift-macos-sidebar for helping put this together.

import Cocoa

class MainViewController: NSViewController {
    @IBOutlet weak var sidebar: NSOutlineView!
    var contentVC: ContentViewController? = nil
    let sectionHeaders = ["Network", "System", "Data Collection"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup notification for window losing and gaining focus
        NotificationCenter.default.addObserver(self, selector: #selector(windowLostFocus), name: NSApplication.willResignActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(windowGainedFocus), name: NSApplication.willBecomeActiveNotification, object: nil)
    }
}

extension MainViewController: NSOutlineViewDataSource {
    // Number of items in the sidebar
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        return sectionHeaders.count
    }
    // Items to be added to sidebar
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        return sectionHeaders[index]
    }
    // Whether rows are expandable by an arrow
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        return false
    }
    // Height of each row
    func outlineView(_ outlineView: NSOutlineView, heightOfRowByItem item: Any) -> CGFloat {
        return 40.0
    }
    @objc func windowLostFocus(_ notification: Notification) {
        setRowColour(sidebar, false)
    }
    @objc func windowGainedFocus(_ notification: Notification) {
        setRowColour(sidebar, true)
    }
    // When a row is selected
    func outlineViewSelectionDidChange(_ notification: Notification) {
        if let outlineView = notification.object as? NSOutlineView {
            setRowColour(outlineView, true)
            contentVC?.updateLabel(newText: sectionHeaders[self.sidebar.selectedRow])
        }
    }
    func setRowColour(_ outlineView: NSOutlineView, _ windowFocused: Bool) {
        let rows = IndexSet(integersIn: 0..<outlineView.numberOfRows)
        let rowViews = rows.compactMap { outlineView.rowView(atRow: $0, makeIfNecessary: false) }
        var initialLoad = true
        // Iterate over each row in the outlineView
        for rowView in rowViews {
            if rowView.isSelected {
                initialLoad = false
            }
            if windowFocused && rowView.isSelected {
                let color = NSColor(calibratedHue: 0.675, saturation: 0.44, brightness: 0.78, alpha: 0.4)
                rowView.backgroundColor = color // Xcode 9 asset colours
            }
            else if rowView.isSelected {
                rowView.backgroundColor = #colorLiteral(red: 0.8899999857, green: 0.8899999857, blue: 0.8799999952, alpha: 1)
            }
            else {
                rowView.backgroundColor = .clear
            }
        }
        
        if initialLoad {
            self.setInitialRowColour()
        }
    }
    func setInitialRowColour() {
        sidebar.rowView(atRow: 0, makeIfNecessary: true)?.backgroundColor = NSColor(calibratedHue: 0.675, saturation: 0.44, brightness: 0.78, alpha: 0.4)
        contentVC?.updateLabel(newText: sectionHeaders[0])
    }
    // Remove default selection colour
    func outlineView(_ outlineView: NSOutlineView, didAdd rowView: NSTableRowView, forRow row: Int) {
        rowView.selectionHighlightStyle = .none
    }
    func getSelectedCell() -> NSTableCellView? {
        if let view = self.sidebar.rowView(atRow: self.sidebar.selectedRow, makeIfNecessary: false) {
            return view.view(atColumn: self.sidebar.selectedColumn) as? NSTableCellView
        }
        return nil
    }
}

extension MainViewController: NSOutlineViewDelegate {
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        var view: NSTableCellView?
        if let title = item as? String {
            view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "ItemCell"), owner: self) as? NSTableCellView
            if let textField = view?.textField {
                textField.stringValue = title
                textField.sizeToFit()
            }
        }
        return view
    }
}
