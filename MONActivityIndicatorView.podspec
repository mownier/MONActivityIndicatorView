Pod::Spec.new do |s|
  s.name     = 'MONActivityIndicatorView'
  s.version  = '0.0.1'
  s.platform = :ios, '7.0'
  s.license  = 'MIT'
  s.homepage = 'https://github.com/mownier/MONActivityIndicatorView'
  s.author   = { 'Mounir Ybanez' => 'rinuom91@gmail.com' }
  s.source   = { :git => 'https://github.com/mownier/MONActivityIndicatorView.git', :tag => s.version.to_s }
  s.description = 'An awesome custom activity indicator view for iOS.'
  s.frameworks   = 'QuartzCore'
  s.source_files = 'MONActivityIndicatorView/*.{h,m}'
  s.requires_arc = true
end
