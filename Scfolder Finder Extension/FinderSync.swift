//
//  FinderSync.swift
//  Scfolder Finder Extension
//
//  Created by Terje Lønøy on 21/03/2022.
//

import Cocoa
import FinderSync

class FinderSync: FIFinderSync {

    private let extendedAttributeName = "no.lonoy.Scfolder.Folder"
    
    override init() {
        super.init()
        
        FIFinderSyncController.default().directoryURLs = [URL(fileURLWithPath: "/")]
    }
    
    // MARK: - Menu and toolbar item support
    
    override func menu(for menuKind: FIMenuKind) -> NSMenu {
        let menu = NSMenu(title: "")
        let rootItem = NSMenuItem(title: "Scfolder", action: nil, keyEquivalent: "")
        let submenu = NSMenu(title: "")
        
        var submenuItems: [NSMenuItem] = Folders.allCases.map { folder in
            let item = NSMenuItem(title: folder.rawValue, action: #selector(handleMenuItem(_:)), keyEquivalent: "")
            item.image = NSImage(named: folder.iconName)
            
            return item
        }
        
        let defaultItem = NSMenuItem(title: "Default", action: #selector(handleMenuItem(_:)), keyEquivalent: "")
        defaultItem.image = NSImage(named: "default")
        submenuItems.insert(defaultItem, at: 0)
        
        submenu.items = submenuItems
        rootItem.submenu = submenu
        menu.addItem(rootItem)
        
        return menu
    }

    @objc private func handleMenuItem(_ sender: NSMenuItem) {
        let selectedItemURLs = FIFinderSyncController.default().selectedItemURLs()
        
        for itemURL in selectedItemURLs! {
            var image: NSImage?
            
            if let imageName = Folders(rawValue: sender.title)?.imageName {
                image = NSImage(named: imageName)
            }
            
            if NSWorkspace.shared.setIcon(image, forFile: itemURL.path, options: []) {
                if image == nil {
                    try? itemURL.removeExtendedAttribute(forName: extendedAttributeName)
                } else {
                    try? itemURL.setExtendedAttribute(data: "scelto_dark".data(using: .utf8)!, forName: extendedAttributeName)
                }
            }
        }
    }
}

