import XCTest
@testable import ObservableKit

enum OKError: Error, CustomStringConvertible {
  case noFound

  var code: Int {
    switch self {
    case .noFound:
      return 1_004
    }
  }

  var description: String {
    switch self {
    case .noFound:
      return "No found"
    }
  }
}

class ViewModel {
  var observable: OKObservable<OKState<Any, OKError>> = OKObservable(.loading)

  enum Status {
    case success
    case error
  }

  func fetchData(_ status: Status) {
    switch status {
    case .success:
      observable.value = .load(data: true)
    case .error:
      observable.value = .errored(error: .noFound)
    }
  }
}

final class ObservableKitTests: XCTestCase {

  // MARK: - Properties
  private var viewModel: ViewModel?

  static var allTests = [
    ("testFetchDataWithSuccess", testFetchDataWithSuccess),
    ("testFetchDataWithError", testFetchDataWithError)
  ]

  // MARK: - Overrides
  override func setUp() {
    super.setUp()
    viewModel = ViewModel()
  }

  override func tearDown() {
    viewModel = nil
    super.tearDown()
  }

  // MARK: - Test Methods
  func testFetchDataWithSuccess() {
    let expectation = self.expectation(description: "Wait for fetch data with success")
    var result = false

    viewModel?.observable.didChange = { state in
      switch state {
      case .loading:
        break
      case .load(let status):
        result = status as? Bool ?? false
        expectation.fulfill()
      default:
        XCTFail("❌ This test should finish with success")
      }
    }

    viewModel?.fetchData(.success)

    waitForExpectations(timeout: 0.3)

    XCTAssertTrue(result)
  }

  func testFetchDataWithError() {
    let expectation = self.expectation(description: "Wait for fetch data with error")
    var result: Error?

    viewModel?.observable.didChange = { state in
      switch state {
      case .loading:
        break
      case .errored(let error):
        result = error
        expectation.fulfill()
      default:
        XCTFail("❌ This test should finish with error")
      }
    }

    viewModel?.fetchData(.error)

    waitForExpectations(timeout: 0.3)

    let error = result as? OKError

    XCTAssertEqual(error?.code, 1_004)
    XCTAssertEqual(error?.description, "No found")
  }
}
