
Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  # 下面三个是分别是名称、版本、简介。这个再pod search的时候会显示出来

  s.name         = "XJContactPicker"
  s.version      = "0.0.1"
  s.summary      = "简单的联系人选取器 A simple picker for Contacts"

  #  主页地址
  s.homepage     = "https://github.com/LiuXiangJing/XJContactPicker.git"

  #证书
  s.license      = "MIT"

  #作者信息
  s.author             = { "刘向晶" => "lxj_tintin@126.com" }


  # 使用平台以及版本
  s.platform     = :ios, "8.0"

  #github地址 或你代码放的地址
  s.source       = { :git => "https://github.com/LiuXiangJing/XJContactPicker.git", :tag => "#{s.version}" }


  # 这个比较重要了。他就是指你哪个文件下的 .h 和.m作为库的内容。我这边直接设置的ContactsManager
  # 文件夹下的所有类。
  s.source_files  =  "ContactsManager/**/*.{h,m}"

  # 所需要的系统库、单个的用第一个，多个的用第二个
  # s.framework  = "SomeFramework"
  s.frameworks = "AddressBookUI", "AddressBook", "Contacts", "ContactsUI"

  # 如果是需要引进其他Cocoapod的库
  #s.dependency "AFNetworking", "~> 3.1.0"
  #s.dependency "MBProgressHUD", "~> 1.0.0"

end
