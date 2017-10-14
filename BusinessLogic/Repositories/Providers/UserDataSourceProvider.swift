//
//  UserDataSourceProvider.swift
//  odin
//
//  Created by Ignacio Giagante on 5/10/17.
//  Copyright © 2017 Peryisa. All rights reserved.
//

import Foundation
import Domain
import Realm

protocol UserDataSourceProviderDomain {
  
  func makeUserAPI() -> UsersNetwork
  
  func makeUserRealm() -> RealmDataSource<User>
  
}

final class UserDataSourceProvider: UserDataSourceProviderDomain {
  
  func makeUserAPI() -> UsersNetwork {
    return NetworkProvider().makeUsersNetwork()
  }
  
  func makeUserRealm() -> RealmDataSource<User> {
    return RealmDataSource<User>()
  }
  
}
