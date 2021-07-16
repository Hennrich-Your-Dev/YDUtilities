#
#  Be sure to run `pod spec lint YDUtilities.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "YDUtilities"
  spec.version      = "1.4.8"
  spec.summary      = "YDUtilities."

  spec.license          = "MIT"
  spec.author           = { "Douglas Hennrich" => "douglashennrich@yourdev.com.br" }
  spec.homepage         = "https://yourdev.com.br"

  spec.platform         = :ios, "11.0"
  spec.source           = { :git => "https://github.com/Hennrich-Your-Dev/YDUtilities.git", :tag => "#{spec.version}" }

  spec.source_files     = "YDUtilities/**/*.{h,m,swift}"
  spec.swift_version    = "5.0"

  spec.dependency "Alamofire", "~> 4.0"
  spec.dependency "YDExtensions", "~> 1.4.0"
  spec.dependency "YDB2WModels", "~> 1.4.0"
end
