//
//  AppCoordinator.swift
//  RxSwiftApp
//
//  Created by Wojciech Spaleniak on 18/03/2023.
//

import UIKit

// MARK: - Protokół
protocol Coordinator {
    var childCoordinators: [Coordinator] { get }
    var navigationController: UINavigationController? { get }
    func start()
}

// MARK: - Główny koordynator aplikacji
final class AppCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private(set) var navigationController: UINavigationController?
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // Funkcja wywoływana w SceneDelegate
    // Dzięki rozszerzeniu instantiate() widzi zmiany ze storyboard
    // Startujemy początkowy Kontroler widoku
    // Wszczepiamy w tym miejscu ViewModel do Kontrolera widoku
    func start() {
        let viewController = ViewController.instantiate()
        let viewModel = ViewModel()
        viewController.viewModel = viewModel
        navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
