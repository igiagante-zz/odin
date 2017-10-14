//
//  User.swift
//  odin
//
//  Created by Ignacio Giagante on 4/10/17.
//  Copyright © 2017 Peryisa. All rights reserved.
//

import Foundation


public struct User {
  
  public let username: String
  public let password: String
  public let uid: String
  
  public init(uid: String, username: String, password: String) {
    self.uid = uid
    self.username = username
    self.password = password
  }
}

/*

public struct User {
  
  public let email: String
  public let name: String
  public let phone: String
  public let uid: String
  public let username: String
  
  public init(email: String,
              name: String,
              phone: String,
              uid: String,
              username: String) {
    self.email = email
    self.name = name
    self.phone = phone
    self.uid = uid
    self.username = username
  }
}

extension User: Equatable {
  public static func == (lhs: User, rhs: User) -> Bool {
    return lhs.uid == rhs.uid &&
      lhs.email == rhs.email &&
      lhs.name == rhs.name &&
      lhs.phone == rhs.phone &&
      lhs.username == rhs.username
  }
} */
