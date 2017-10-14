//
//  UseCaseProvider.swift
//  odin
//
//  Created by Ignacio Giagante on 5/10/17.
//  Copyright © 2017 Peryisa. All rights reserved.
//

import Foundation
import Domain

public final class UserUseCaseProvider: Domain.UserUseCaseProvider {
  
  let repository = UserRepository()
  
  public init() {}
  
  public func makeCreateUserUseCase() -> Domain.SaveUserUseCase {
    return SaveUserUseCase(repository: repository)
  }

  public func makeGetUsersUseCase() -> Domain.GetUsersUseCase {
    return GetUsersUseCase(repository: repository)
  }
  
}
