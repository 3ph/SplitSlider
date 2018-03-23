#
# Be sure to run `pod lib lint SplitSlider.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SplitSlider'
  s.version          = '0.1.1'
  s.summary          = 'A simple customizable two way slider.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Two way slider with zero (minimum) in the middle. In fact two sliders combined into one,
  left one increasing towards left, right one towards right.
  The appearance is customizable as well as the individual slider portions.
                       DESC

  s.homepage         = 'https://github.com/3ph/SplitSlider'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '3ph' => 'instantni.med@gmail.com' }
  s.source           = { :git => 'https://github.com/3ph/SplitSlider.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SplitSlider/Classes/**/*'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

  # s.resource_bundles = {
  #   'SplitSlider' => ['SplitSlider/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
