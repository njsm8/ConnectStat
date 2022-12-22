//
//  StatusBarController.swift
//  ConnectStat
//
//  Created by Nischit Shetty on 22/12/22.
//

import Cocoa
import SystemConfiguration

class StatusBarController: NSObject {
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = NSMenu()
    var timer = Timer()

    override func awakeFromNib() {
        statusItem.menu = menu
        updateConnectivityStatus()
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(updateConnectivityStatus), userInfo: nil, repeats: true)
    }

    @objc func updateConnectivityStatus() {
        let reachability = SCNetworkReachabilityCreateWithName(nil, "www.google.com")
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability!, &flags)

        if flags.contains(.reachable) {
            statusItem.button?.image = NSImage(named: "green_dot")
            statusItem.button?.title = "Connected"
        } else {
            statusItem.button?.image = NSImage(named: "red_dot")
            statusItem.button?.title = "Disconnected"
        }
    }
}
