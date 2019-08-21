Pod::Spec.new do |s|
  s.name               = "ObservableKit"
  s.version            = "1.0.2"
  s.summary            = "ObservableKit is the easiest way to observe values in Swift"
  s.requires_arc       = true
  s.homepage           = "https://github.com/limadeveloper/ObservableKit"
  s.license            = "MIT"
  s.author             = { "John Lima" => "thejohnlima@icloud.com" }
  s.social_media_url   = "https://twitter.com/thejohnlima"
  s.platform           = :ios, "9.3"
  s.source             = { :git => "https://github.com/limadeveloper/ObservableKit.git", :tag => "#{s.version}" }
  s.source_files       = "Framework/ObservableKit/Source/*.{swift}"
  s.swift_version      = "5.0"
end