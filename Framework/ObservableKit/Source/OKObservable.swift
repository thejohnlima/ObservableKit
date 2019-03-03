//
//  OKObservable.swift
//  ObservableKit
//
//  Created by John Lima on 02/03/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import Foundation

public class OKObservable<T> {

  private var _value: T?
  public var didChange: ((T) -> Void)?

  public var value: T {
    get { return _value! }
    set {
      _value = newValue
      didChange?(_value!)
    }
  }

  public init(_ value: T) {
    self.value = value
  }

  deinit {
    _value = nil
    didChange = nil
  }
}
