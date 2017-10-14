//
//  RMUser.swift
//  CleanArchitectureRxSwift
//
//  Created by Andrey Yastrebov on 10.03.17.
//  Copyright © 2017 sergdort. All rights reserved.
//

import QueryKit
import Domain
import RealmSwift
import Realm

final class RMUser: Object {
  
  dynamic var uid: String = ""
  dynamic var username: String = ""
  dynamic var password: String = ""
  
  override class func primaryKey() -> String? {
    return "uid"
  }
}

extension RMUser {
  static var username: Attribute<String> { return Attribute("username")}
  static var password: Attribute<String> { return Attribute("password")}
  static var uid: Attribute<String> { return Attribute("uid")}
}

extension RMUser: DomainConvertibleType {
  func asDomain() -> User {
    return User(uid: uid,
                username: username,
                password: password)
  }
}

extension User: RealmRepresentable {
  func asRealm() -> RMUser {
    return RMUser.build { object in
      object.uid = uid
      object.password = password
      object.username = username
    }
  }
}

/*

final class RMUser: Object {

    dynamic var email: String = ""
    dynamic var name: String = ""
    dynamic var phone: String = ""
    dynamic var uid: String = ""
    dynamic var username: String = ""
    
    override class func primaryKey() -> String? {
        return "uid"
    }
}

extension RMUser {
    static var email: Attribute<String> { return Attribute("email")}
    static var name: Attribute<String> { return Attribute("name")}
    static var phone: Attribute<String> { return Attribute("phone")}
    static var username: Attribute<String> { return Attribute("username")}
    static var uid: Attribute<String> { return Attribute("uid")}
}

extension RMUser: DomainConvertibleType {
    func asDomain() -> User {
        return User(email: email,
                    name: name,
                    phone: phone,
                    uid: uid,
                    username: username)
    }
}

extension User: RealmRepresentable {
    func asRealm() -> RMUser {
        return RMUser.build { object in
            object.uid = uid
            object.email = email
            object.name = name
            object.phone = phone
            object.username = username
        }
    }
} */
