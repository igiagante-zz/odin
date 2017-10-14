//
//  UsersNavigator.swift
//  odin
//
//  Created by Ignacio Giagante on 5/10/17.
//  Copyright © 2017 Peryisa. All rights reserved.
//

import Foundation
import Domain

protocol UsersNavigator {
  func toCreateUser()
  func toUser(_ user: User)
  func toUsers()
}

class DefaultUsersNavigator: UsersNavigator {
  
  private let storyBoard: UIStoryboard
  private let navigationController: UINavigationController
  private let services: UserUseCaseProvider
  
  init(services:  UserUseCaseProvider,
       navigationController: UINavigationController,
       storyBoard: UIStoryboard) {
    self.services = services
    self.navigationController = navigationController
    self.storyBoard = storyBoard
  }
  
  func toUsers() {
    let vc = storyBoard.instantiateViewController(ofType: UsersViewController.self)
    vc.viewModel = UsersViewModel(useCase: services.makeGetUsersUseCase(),
                                  navigator: self)
    navigationController.pushViewController(vc, animated: true)
  }
  
  
  func toCreateUser() {
    /*
    let navigator = DefaultCreateUserNavigator(services: <#UserUseCaseProvider#>, navigationController: navigationController, storyBoard: <#UIStoryboard#>)
    let viewModel = CreateUserViewModel(createUserUseCase: services.makeCreateUserUseCase(),navigator: navigator)
    
    let vc = storyBoard.instantiateViewController(ofType: CreateUserViewController.self)
    vc.viewModel = viewModel
    let nc = UINavigationController(rootViewController: vc)
    navigationController.present(nc, animated: true, completion: nil)
 */
  }
  
  func toUser(_ post: User) {
  }
  
}
