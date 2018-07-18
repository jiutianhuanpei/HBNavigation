Pod::Spec.new do |s|

  s.name         = "HBNavigation"
  s.version      = "0.0.1"
  s.summary      = "让每个 controller 有一个独立的导航栏"

  s.description  = <<-DESC
    让每个 controller 有一个独立的导航栏，可以单独设置导航栏透明度及获取系统返回按钮的事件
                   DESC

  s.homepage     = "https://github.com/jiutianhuanpei/HBNavigation.git"

  s.license      = "MIT"
  s.author             = { "shenhongbang" => "shenhongbang@163.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/jiutianhuanpei/HBNavigation.git", :tag => s.version }

  s.source_files  = "Sources/*"

  s.frameworks = "UIKit"
  s.requires_arc = true
  
  #s.dependency  'HYMediator'	#这个是此库依赖的三方库
  #s.xcconfig = {
  # 'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/HYMediator'  #这个是配置路径，如果本库有依赖与三方的文件，需要配置这个，否则报错
  #}

end
