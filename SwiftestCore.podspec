Pod::Spec.new do |s|
  s.name     = "SwiftestCore"
  s.version  = "0.0.2"
  s.summary  = "Swiftest Core Libraries"
  s.homepage = "https://github.com/Swiftest/SwiftestCore"
  s.license  = "MIT"

  s.author   = { "Brian Pratt" => "brian@8thlight.com" }
  s.source = { :git => "https://github.com/Swiftest/SwiftestCore.git",
                 :tag => "0.0.2" }

  s.source_files  = "src/SwiftestCore/**/*.swift"

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"

  s.requires_arc = true
end
