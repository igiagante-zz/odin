//
//  CreateUserNavigator.swift
//  odin
//
//  Created by Ignacio Giagante on 5/10/17.
//  Copyright © 2017 Peryisa. All rights reserved.
//

import Foundation
import Domain

protocol CreateUserNavigator {
  
  func toLogin()
}

final class DefaultCreateUserNavigator: CreateUserNavigator {
  
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
  
  func toLogin() {
    
    let vc = storyBoard.instantiateViewController(ofType: CreateUserViewController.self)
    vc.viewModel = CreateUserViewModel(createUserUseCase: services.makeCreateUserUseCase(),
                                  navigator: self)
    navigationController.pushViewController(vc, animated: true)
  }
}
