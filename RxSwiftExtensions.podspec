Pod::Spec.new do |s|
  s.name             = "RxSwiftExtensions"
  s.version          = "1.0.0"
  s.summary          = "Frequently used extensoins in RxSwift"
  s.homepage         = "https://github.com/tokijh/RxSwiftExtensions"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "tokijh" => "tokijh@naver.com" }
  s.source           = { :git => "https://github.com/tokijh/RxSwiftExtensions.git",
                         :tag => s.version.to_s }
  s.source_files = "RxSwiftExtensions/**/*.swift"
  s.frameworks   = "Foundation"
  s.dependency "RxSwift", ">= 4.0"
  s.dependency "RxCocoa", ">= 4.0"
  s.dependency "RxOptional", ">= 3.5"

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.11"
  s.tvos.deployment_target = "9.0"
  s.watchos.deployment_target = "2.0"
end
