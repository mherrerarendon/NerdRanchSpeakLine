//
//  AppDelegate.swift
//  SpeakLine
//
//  Created by Marco Herrera on 2/17/16.
//  Copyright (c) 2016 Marco Herrera. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate
{
    var mainWindowController: MainWindowController?


    func applicationDidFinishLaunching(aNotification: NSNotification)
    {
        // Insert code here to initialize your application
        let mainWindowController = MainWindowController()
        mainWindowController.showWindow(self)
        self.mainWindowController = mainWindowController
    }
}

