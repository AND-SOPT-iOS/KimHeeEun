//
//  SceneDelegate.swift
//  35-Seminar-hee4
//
//  Created by 김희은 on 11/2/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: SignUpViewController())
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}