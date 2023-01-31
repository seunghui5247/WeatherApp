//
//  Cordinator.swift
//  weatherApp
//
//  Created by 천승희 on 2023/01/31.
//

import UIKit

class Cordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let rootViewController = MainViewController()
        let navigationRootViewController = UINavigationController(rootViewController: rootViewController)
        window.rootViewController = navigationRootViewController
        window.makeKeyAndVisible()
    }
}
