//
//  UserUseCaseProvider.swift
//  odin
//
//  Created by Ignacio Giagante on 4/10/17.
//  Copyright © 2017 Peryisa. All rights reserved.
//

import Foundation

public protocol UserUseCaseProvider {
  
  func makeCreateUserUseCase() -> SaveUserUseCase
  
  func makeGetUsersUseCase() -> GetUsersUseCase
}
