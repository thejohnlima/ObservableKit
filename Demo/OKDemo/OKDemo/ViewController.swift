//
//  ViewController.swift
//  OKDemo
//
//  Created by John Lima on 02/03/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // MARK: - Properties
  @IBOutlet weak var imageView: UIImageView!

  private let viewModel = ViewModel()

  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    addObservers()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    updateUI()
  }

  // MARK: - Private Methods
  private func updateUI() {
    viewModel.fetchImage()
  }

  private func addObservers() {
    viewModel.observable.didChange = { [weak self] status in
      DispatchQueue.main.async {
        switch status {
        case .load(data: let data):
          print("✅ fetch image with succss")
          let image = UIImage(data: data)
          self?.imageView.image = image
        case .loading:
          print("🚀 loading data...")
        case .errored(error: let error):
          print("❌ get an error: \(error)")
        case .empty:
          print("❌ data not found")
        }
      }
    }
  }
}
