# ObservableKit

[![GitHub release](https://img.shields.io/github/release/limadeveloper/ObservableKit.svg)](https://github.com/limadeveloper/ObservableKit/releases)
[![Build Status](https://travis-ci.com/limadeveloper/ObservableKit.svg?branch=master)](https://travis-ci.com/limadeveloper/ObservableKit)
[![CocoaPods](https://img.shields.io/badge/Cocoa%20Pods-✓-4BC51D.svg?style=flat)](https://cocoapods.org/pods/ObservableKit)
[![GitHub repo size](https://img.shields.io/github/repo-size/limadeveloper/ObservableKit.svg)](https://github.com/limadeveloper/ObservableKit)
[![License](https://img.shields.io/github/license/limadeveloper/ObservableKit.svg)](https://raw.githubusercontent.com/limadeveloper/ObservableKit/master/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/ObservableKit.svg?style=flat)](https://developer.apple.com/ios/)

ObservableKit is the easiest way to observe values in Swift.

## Requirements

- iOS 9.3+
- Swift 4.0+

## Installation

### CocoaPods

**ObservableKit** is available through [CocoaPods](https://cocoapods.org/pods/ObservableKit). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ObservableKit', '~> 1.0'
```

and run `pod install`

### Manual

Just copy source folder to your project.

```script
Framework > ObservableKit > Source
```

## How to use

Import library in your swift file:

```Swift
import ObservableKit
```

**Download image example**  
Setup ObservableKit in your ViewModel:

```Swift
let observable: OKObservable<OKState<Data, Error>> = OKObservable(OKState.loading)

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
```

Than, in your view controller call the observer:

```swift
@IBOutlet weak var imageView: UIImageView!

private let viewModel = ViewModel()

override func viewDidLoad() {
  super.viewDidLoad()
  addObservers()
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

private func loadImage() {
  viewModel.fetchImage()
}
```

## Communication

- If you found a bug, open an issue.
- If you have a feature request, open an issue.
- If you want to contribute, submit a pull request. 👨🏻‍💻

## License

**ObservableKit** is under MIT license. See the [LICENSE](https://raw.githubusercontent.com/limadeveloper/ObservableKit/master/LICENSE) file for more info.
