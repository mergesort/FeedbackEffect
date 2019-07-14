Pod::Spec.new do |spec|
  spec.name         = 'FeedbackEffect'
  spec.version      = '1.5'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.homepage     = 'https://github.com/mergesort/FeedbackEffect'
  spec.authors      =  { 'Joe Fabisevich' => 'github@fabisevi.ch' }
  spec.summary      = 'A μ library for playing sounds and providing haptic feedback with ease.'
  spec.source       =   { :git => 'https://github.com/mergesort/FeedbackEffect.git', :tag => "#{spec.version}" }
  spec.source_files = 'Sources/FeedbackEffect/*.swift'
  spec.framework    = 'AudioToolbox', 'AVFoundation', 'UIKit'
  spec.requires_arc = true
  spec.social_media_url = 'https://twitter.com/mergesort'
  spec.ios.deployment_target = '10.0'
  spec.swift_version = '5.0'
end
