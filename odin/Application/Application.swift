//
//  Application.swift
//  odin
//
//  Created by Ignacio Giagante on 5/10/17.
//  Copyright © 2017 Peryisa. All rights reserved.
//

import Foundation
import Domain
import BusinessLogic

final class Application {
  
  static let shared = Application()
  
  private let userUseCaseProvider: Domain.UserUseCaseProvider
  
  private init() {
    self.userUseCaseProvider = BusinessLogic.UserUseCaseProvider()
  }
  
  func configureMainInterface(in window: UIWindow) {

    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let usersNavigationController = UINavigationController()
    
    usersNavigationController.tabBarItem = UITabBarItem(title: "Users",
                                                     image: UIImage(named: "users"),
                                                     selectedImage: nil)
    
    let usersNavigator = DefaultUsersNavigator(services: userUseCaseProvider,
                                            navigationController: usersNavigationController,
                                            storyBoard: storyboard)
    
    let createUserNavigationController = UINavigationController()
    
    createUserNavigationController.tabBarItem = UITabBarItem(title: "Login",
                                                        image: UIImage(named: "login"),
                                                        selectedImage: nil)
    
    let createUserNavigator = DefaultCreateUserNavigator(services: userUseCaseProvider,
                                            navigationController: createUserNavigationController,
                                            storyBoard: storyboard)
    
    let tabBarController = UITabBarController()
    tabBarController.viewControllers = [
      usersNavigationController,
      createUserNavigationController
    ]
    
    window.rootViewController = tabBarController
    
    usersNavigator.toUsers()
    createUserNavigator.toLogin()

  }
}
