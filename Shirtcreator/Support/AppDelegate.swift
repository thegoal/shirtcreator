//
//  AppDelegate.swift
//  ShirtcreatorTest
//
//  Created by Ishaq on 12/31/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIApplication.shared.windows.first;
        return true
    }
    
    // Delegate to show alert etc on top 
    
    func SharedDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}

