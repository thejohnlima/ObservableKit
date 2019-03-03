//
//  OKState.swift
//  ObservableKit
//
//  Created by John Lima on 02/03/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import Foundation

public enum OKState<T> {
  case loading
  case errored(error: Error)
  case load(data: T)
  case empty
}
