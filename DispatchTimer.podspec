#
#  Be sure to run `pod spec lint DispatchTimer.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "DispatchTimer"
  s.version      = "0.0.3"
  s.summary      = "GCD Timer for iOS or OSX."
  s.homepage     = "https://github.com/FlameGrace/DispatchTimer"
  s.license      = { :type => "Apache", :file => "LICENSE" }
  s.author             = { "FlameGrace" => "flamegrace@hotmail.com" }
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.source       = { :git => "https://github.com/FlameGrace/DispatchTimer.git", :tag => "0.0.3" }
  s.source_files  = "DispatchTimer", "**/*.{h,m}"
  s.public_header_files = "**/*.h"
end
