platform :ios, '13.0'
inhibit_all_warnings!
use_modular_headers!
use_frameworks!
source 'https://github.com/CocoaPods/Specs'

target 'iov-ios-app' do
  pod 'Alamofire', '~> 5.7.1' #网络请求
  pod 'MBProgressHUD' #加载动效
  pod 'RealmSwift' #本地数据库
  pod 'RxSwift' #响应式框架
  pod 'SwiftyJSON' #JSON数据解析
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
        end
    end
end

