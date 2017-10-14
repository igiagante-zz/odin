//
//  GetUsersUseCase.swift
//  odin
//
//  Created by Ignacio Giagante on 4/10/17.
//  Copyright © 2017 Peryisa. All rights reserved.
//

import Foundation

import RxSwift

public protocol GetUsersUseCase {
  func users() -> Observable<[User]>
}
