//
//  UsersViewModel.swift
//  odin
//
//  Created by Ignacio Giagante on 5/10/17.
//  Copyright © 2017 Peryisa. All rights reserved.
//

import Foundation
import Domain
import BusinessLogic
import RxCocoa

final class UsersViewModel: ViewModelType {
  
  struct Input {
    let trigger: Driver<Void>
  }
  struct Output {
    let fetching: Driver<Bool>
    let users: Driver<[UserItemViewModel]>
    let error: Driver<Error>
  }
  
  private let useCase: GetUsersUseCase
  private let navigator: UsersNavigator
  
  init(useCase: GetUsersUseCase, navigator: UsersNavigator) {
    self.useCase = useCase
    self.navigator = navigator
  }
  
  func transform(input: Input) -> Output {
    
    let activityIndicator = ActivityIndicator()
    let errorTracker = ErrorTracker()
    
    let users = input.trigger.flatMapLatest {
      return self.useCase.users()
        .trackActivity(activityIndicator)
        .trackError(errorTracker)
        .asDriverOnErrorJustComplete()
        .map { $0.map { user in UserItemViewModel(with: user)} }
    }
    
    let fetching = activityIndicator.asDriver()
    let errors = errorTracker.asDriver()
    
    return Output(fetching: fetching,
                  users: users,
                  error: errors)
  }
  
}
