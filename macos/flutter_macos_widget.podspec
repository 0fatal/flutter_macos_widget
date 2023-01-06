#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_macos_widget.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_macos_widget'
  s.version          = '0.0.1'
  s.summary          = 'Develop for macOS app widget.'
  s.description      = <<-DESC
Develop for macOS app widget.
                       DESC
  s.homepage         = 'https://github.com/0xfatal/flutter_macos_widget'
  s.license          = { :file => '../LICENSE' }
  s.author           = { '0fatal' => 'zacharywin233@gmail.com' }

  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
