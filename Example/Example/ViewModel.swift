//
//  ViewModel.swift
//  Example
//
//  Created by John Lima on 02/03/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import Foundation

class ViewModel {

  // MARK: - Properties
  let model: Model
  let observable: OKObservable<OKState<Data, Error>> = OKObservable(OKState.loading)

  // MARK: - Initializers
  init() {
    let model = Model(
      name: "Beautiful",
      image: "https://i.pinimg.com/564x/08/b2/8e/08b28e383fdb2d4d6c9a7b7c44b6d842.jpg?b=t"
    )
    self.model = model
  }

  // MARK: - Public Methods
  func fetchImage() {
    let url = URL(string: model.image)!
    observable.value = .loading
    URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
      if let error = error {
        self.observable.value = .errored(error: error)
        return
      }
      self.observable.value = data != nil ? .load(data: data!) : .empty
    }).resume()
  }
}
