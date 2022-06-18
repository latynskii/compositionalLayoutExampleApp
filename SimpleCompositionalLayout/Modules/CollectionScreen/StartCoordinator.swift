//
//  StartCoordinator.swift
//  SimpleCompositionalLayout
//
//  Created by EDUARD Latynsky on 18.06.2022.
//

import UIKit

protocol StartCoordinatorProtocol {
    init(_ window: UIWindow)
    
    func start()
}

class StartCoordinator:StartCoordinatorProtocol {
    
    //MARK: - Properties
    private let window: UIWindow
    
    required init(_ window: UIWindow) {
        self.window = window
    }
    
    //MARK: - Methods
    func start() {
        let collectionViewController = CollectionViewController()
        let collectionViewPresenter = CollectionViewPresenter(collectionViewController)
        collectionViewController.presener = collectionViewPresenter
        collectionViewPresenter.view = collectionViewController
        
        window.rootViewController = collectionViewController
        window.makeKeyAndVisible()
    }
    
}
