//
//  SaveUserUseCase.swift
//  odin
//
//  Created by Ignacio Giagante on 4/10/17.
//  Copyright © 2017 Peryisa. All rights reserved.
//

import Foundation
import Domain
import RxSwift

final class SaveUserUseCase: Domain.SaveUserUseCase {
  
  private let repository: UserRepository
  
  init(repository: UserRepository) {
    self.repository = repository
  }
  
  func save(user: User) -> Observable<Void> {
    return repository.save(entity: user)
  }
}
