//
//  AppDelegate.swift
//  WorldTime
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var menu: NSMenu?
    @IBOutlet weak var firstMenuItem: NSMenuItem?
    
    var dateTimeView: DateTimeView?
 
    /** MacOS API Menu Item Element */
    var statusItem: NSStatusItem?
    
    /**
        If an app has a storyboard, we can use this function to implement the connections. Otherwise, we use 'applicationDidFinishingLaunching()'
     */
    override func awakeFromNib() {
        print("awake from nib")
        super.awakeFromNib()
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
//        statusItem?.button?.title = "WorldTime"
        
        /** Grab image from XCode assets */
        let itemImage = NSImage(named: "clock")
        itemImage?.isTemplate = true
        statusItem?.button?.image = itemImage
        
        if let menu = menu {
            statusItem?.menu = menu
            
            // enabled the AppDelegate to receive messages form the item's menu delegate
            menu.delegate = self
        }
        
        
        /** Don't really understand what's going on here */
        if let item = firstMenuItem {
            dateTimeView = DateTimeView(frame: NSRect(x: 0.0, y:0.0, width: 250.0, height: 170.0))
            item.view = dateTimeView
        }
        
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}


/**
    unsure of what this extension actually does...
 */
extension AppDelegate: NSMenuDelegate {
    
    /**
        Initial commit :: these can be seen a little bit like lifecycle methods in React
     */
        func menuWillOpen(_ menu: NSMenu) {
        print("extension delegate: menuWillOpen()");
        dateTimeView?.startTimer()
    }
    
    func menuDidClose(_ menu: NSMenu) {
        print("extension delegate: menuDidClose()");
        dateTimeView?.stopTimer()
    }
}


