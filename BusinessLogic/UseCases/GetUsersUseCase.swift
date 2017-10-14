//
//  GetUsersUseCase.swift
//  odin
//
//  Created by Ignacio Giagante on 4/10/17.
//  Copyright © 2017 Peryisa. All rights reserved.
//

import Foundation
import Domain
import RxSwift

final class GetUsersUseCase: Domain.GetUsersUseCase {
  
  private let repository: AbstractRepository<User>
  
  init(repository: AbstractRepository<User>) {
    self.repository = repository
  }
  
  func users() -> Observable<[User]> {
    return repository.queryAll()
  }
  
}
