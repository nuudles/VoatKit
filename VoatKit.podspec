Pod::Spec.new do |s|
  s.name     = 'VoatKit'
  s.version  = '1.0.0'
  s.platform = :ios, '7.0'
  s.summary  = 'Objective-C Voat API Wrapper'
  s.homepage = 'https://github.com/AmarJayR/VoatKit'
  s.author   = { 'Amar Ramachandran' => 'amarrmchndrn1@gmail.com' }
  s.source   = { :git => 'https://github.com/AmarJayR/VoatKit.git', :tag => s.version.to_s }
  s.license      = { :type => 'Apache License, Version 2.0', :file => 'LICENSE.md' }
  s.source_files = 'Classes/*.{h,m}', 'Classes/**/*.{h,m}'
  s.header_mappings_dir =  'Classes'

  s.dependency 'AFNetworking'
  s.dependency 'Mantle'

  s.requires_arc = true
end