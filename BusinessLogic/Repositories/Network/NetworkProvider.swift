//
//  NetworkProvider.swift
//  CleanArchitectureRxSwift
//
//  Created by Andrey Yastrebov on 16.03.17.
//  Copyright © 2017 sergdort. All rights reserved.
//

import Domain

final class NetworkProvider {
  
    private let apiEndpoint: String

    public init() {
        apiEndpoint = "https://jsonplaceholder.typicode.com"
    }

    public func makeUsersNetwork() -> UsersNetwork {
        let network = Network<User>(apiEndpoint)
        return UsersNetwork(network: network)
    }
}
