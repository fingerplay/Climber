platform :ios, '9.0'
use_frameworks!
#install! 'cocoapods', :disable_input_output_paths => true


target 'Climber' do

  pod 'SnapKit', '4.2.0'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '4.2'
#      if config.name.downcase == 'debug'
#          config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] = '$(inherited) DEBUG=1 COCOAPODS=1'
#          config.build_settings['OTHER_SWIFT_FLAGS'] = '-D DEBUG'
#        end
    end
  end
end
