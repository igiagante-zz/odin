//
//  AbstractRepository.swift
//  odin
//
//  Created by Ignacio Giagante on 5/10/17.
//  Copyright © 2017 Peryisa. All rights reserved.
//

import Foundation
import RxSwift

func abstractMethod() -> Never {
  fatalError("abstract method")
}

class AbstractRepository<T> {
  
  func queryAll() -> Observable<[T]> {
    abstractMethod()
  }
  
  func query(with predicate: NSPredicate,
             sortDescriptors: [NSSortDescriptor] = []) -> Observable<[T]> {
    abstractMethod()
  }
  
  func save(entity: T) -> Observable<Void> {
    abstractMethod()
  }
  
  func delete(entity: T) -> Observable<Void> {
    abstractMethod()
  }
}
