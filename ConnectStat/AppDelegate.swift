//
//  AppDelegate.swift
//  ConnectStat
//
//  Created by Nischit Shetty on 22/12/22.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusBarController = StatusBarController()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusBarController.timer.invalidate()
        statusBarController.timer = Timer.scheduledTimer(timeInterval: 5.0, target: statusBarController, selector: #selector(statusBarController.updateConnectivityStatus), userInfo: nil, repeats: true)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        statusBarController.timer.invalidate()
    }
}

