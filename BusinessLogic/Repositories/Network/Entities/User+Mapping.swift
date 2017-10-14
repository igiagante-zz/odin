
//
//  User+Mapping.swift
//  CleanArchitectureRxSwift
//
//  Created by Andrey Yastrebov on 10.03.17.
//  Copyright © 2017 sergdort. All rights reserved.
//

import Domain
import ObjectMapper

extension User: ImmutableMappable {
    
    // JSON -> Object
    public init(map: Map) throws {
        uid = try map.value("id", using: UidTransform())
        username = try map.value("username")
        password = try map.value("password")
    }
}
