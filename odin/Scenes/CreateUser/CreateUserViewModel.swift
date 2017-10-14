//
//  CreateUserViewModel.swift
//  odin
//
//  Created by Ignacio Giagante on 5/10/17.
//  Copyright © 2017 Peryisa. All rights reserved.
//

import Foundation
import Domain
import BusinessLogic
import RxCocoa

final class CreateUserViewModel {
  
  private let createUserUseCase: SaveUserUseCase
  private let navigator: CreateUserNavigator
  
  init(createUserUseCase: SaveUserUseCase, navigator: CreateUserNavigator) {
    self.createUserUseCase = createUserUseCase
    self.navigator = navigator
  }
  
  func transform(input: Input) -> Output {
    
    let passAndUser = Driver.combineLatest(input.username, input.password) {
      $0
    }
    
    let activityIndicator = ActivityIndicator()
    
    let canSave = Driver.combineLatest(passAndUser, activityIndicator.asDriver()) {
      return !$0.0.isEmpty && !$0.1.isEmpty && !$1
      }
    
    let saveUserAndShowAlertDialog = input.registerUserTrigger.withLatestFrom(passAndUser)
      .map { (username, password) -> User in
        return User(uid: NSUUID().uuidString, username: username, password: password)
      }.flatMapLatest { [unowned self] in
        return self.createUserUseCase.save(user: $0)
          .trackActivity(activityIndicator)
          .asDriverOnErrorJustComplete()
      }
    
    return Output(showDialog: saveUserAndShowAlertDialog, saveEnabled: canSave)
  }
  
}

extension CreateUserViewModel {
  
  struct Input {
    let registerUserTrigger: Driver<Void>
    let username: Driver<String>
    let password: Driver<String>
  }
  
  struct Output {
    let showDialog: Driver<Void>
    let saveEnabled: Driver<Bool>
  }
}
