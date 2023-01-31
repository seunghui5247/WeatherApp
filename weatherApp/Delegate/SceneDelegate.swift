//
//  SceneDelegate.swift
//  weatherApp
//
//  Created by 천승희 on 2023/01/31.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: scene)
        let cordinator = Cordinator(window: self.window!)
        cordinator.start()
    }
}
