//
//  SceneDelegate.swift
//  RxSwiftApp
//
//  Created by Wojciech Spaleniak on 18/03/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        // Wystartowanie głównego koordynatora aplikacji
        let window = UIWindow(windowScene: scene)
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
    }
}

