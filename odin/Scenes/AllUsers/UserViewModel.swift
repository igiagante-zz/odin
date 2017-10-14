//
//  UserViewModel.swift
//  odin
//
//  Created by Ignacio Giagante on 12/10/17.
//  Copyright © 2017 Peryisa. All rights reserved.
//

import Foundation
import Domain

final class UserItemViewModel   {
  
  let title:String
  let subtitle : String
  let user: User
  
  init (with user: User) {
    self.user = user
    self.title = user.username.uppercased()
    self.subtitle = user.uid
  }
}
