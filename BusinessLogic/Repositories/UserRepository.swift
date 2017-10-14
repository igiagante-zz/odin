//
//  UserRepository.swift
//  odin
//
//  Created by Ignacio Giagante on 5/10/17.
//  Copyright © 2017 Peryisa. All rights reserved.
//

import Foundation
import RxSwift
import Domain

class UserRepository: AbstractRepository<User> {
  
  private let dataSourceProvider: UserDataSourceProvider
  private let userAPI: UsersNetwork
  private let userRealm: RealmDataSource<User>
  
  init(ds: UserDataSourceProvider = UserDataSourceProvider()) {
    self.dataSourceProvider = ds
    userAPI = ds.makeUserAPI()
    userRealm = ds.makeUserRealm()
  }
  
  override func queryAll() -> Observable<[User]> {
    
    // chequear la base de datos, en caso que los datos sean nulos, se consulta la api
    // si la API trae datos, deben ser persistidos en la DB
    
    return userRealm.queryAll()
  }
  
  override func query(with predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil) -> Observable<[User]> {
    abstractMethod()
  }
  
  override func save(entity user: User) -> Observable<Void> {
    
    print("trying to save an user")
    
    return userRealm.save(entity: user)
  }
  
  override func delete(entity: User) -> Observable<Void> {
    abstractMethod()
  }
  
}
