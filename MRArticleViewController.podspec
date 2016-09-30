#
# Be sure to run `pod lib lint MRArticleViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MRArticleViewController'
  s.version          = '1.0.5'
  s.summary          = 'Allows you to quickly generate view controllers for news articles similar to those in the News app.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC
This framework allows you to easily setup View Controllers to display News Articles inspired by those from the Apple News App. Simply set the required fields and run, and you will have a nice looking view for your articles.
                       DESC

  s.homepage         = 'https://github.com/mrigdon/MRArticleViewController'
  s.screenshots     = 'https://raw.githubusercontent.com/mrigdon/MRArticleViewController/master/preview1.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Matthew Rigdon' => 'rigdonmr@gmail.com' }
  s.source           = { :git => 'https://github.com/mrigdon/MRArticleViewController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MRArticleViewController/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MRArticleViewController' => ['MRArticleViewController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end
