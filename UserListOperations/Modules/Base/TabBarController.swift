//
//  TabBarController.swift
//  UserListOperations
//
//  Created by Burak Pala on 26.01.2025.
//

import UIKit

extension TabbarViewController {
    // MARK: - Constants
    
    enum Constants {
        static let usersListStoryboardFileName = "Users"
        static let usersListNavBar = "UserListNavBar"
        static let usersListVCTabbarImage = "person.fill"
        static let usersVCTitle = "Users"
    }
}

class TabbarViewController: UITabBarController {
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarControllers()
        configureTabBarAppearance()
    }
    
    // MARK: - Setup Methods
    
    private func setupTabBarControllers() {
        let usersListVC = instantiateViewController(storyboardName: Constants.usersListStoryboardFileName, identifier: Constants.usersListNavBar)
        usersListVC.tabBarItem.image = UIImage(systemName: Constants.usersListVCTabbarImage)
        
        usersListVC.title = Constants.usersVCTitle
        
        setViewControllers([usersListVC], animated: true)
    }
    
    private func instantiateViewController(storyboardName: String, identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
    
    private func configureTabBarAppearance() {
        tabBar.tintColor = .white
        tabBar.backgroundColor = .black
        tabBar.isTranslucent = false
    }
}

