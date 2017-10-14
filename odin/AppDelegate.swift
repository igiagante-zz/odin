//
//  AppDelegate.swift
//  odin
//
//  Created by Ignacio Giagante on 4/10/17.
//  Copyright © 2017 Peryisa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    let window = UIWindow(frame: UIScreen.main.bounds)
    
    Application.shared.configureMainInterface(in: window)
    
    self.window = window
    return true
  }
  
}

