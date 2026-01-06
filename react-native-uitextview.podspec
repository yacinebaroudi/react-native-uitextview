require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

# Detect whether the new architecture / Fabric is enabled
new_arch_enabled = ENV['RCT_NEW_ARCH_ENABLED'] == '1'


Pod::Spec.new do |s|
  s.name         = "react-native-uitextview"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => min_ios_version_supported }
  s.source       = { :git => "https://github.com/bluesky-social/react-native-uitextview.git", :tag => "#{s.version}" }

  # Include ObjC/C++ source files only (NO Swift, NO Markdown - moved to main app)
  s.source_files = "ios/**/*.{h,mm,cpp}"
  s.exclude_files = "ios/Markdown/**/*"

  # Mark C++ headers as private to hide them from public interface
  s.private_header_files = [
    "ios/RNUITextViewChildComponentDescriptor.h",
    "ios/RNUITextViewChildShadowNode.h",
    "ios/RNUITextViewComponentDescriptor.h",
    "ios/RNUITextViewShadowNode.h"
  ]

  # Include Privacy Manifest
  s.resource_bundles = {
    'react-native-uitextview-Privacy' => ['ios/PrivacyInfo.xcprivacy']
  }

  # Configure C++ compiler settings
  s.pod_target_xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++20',
    'CLANG_CXX_LIBRARY' => 'libc++',
    'DEFINES_MODULE' => 'YES'
  }

  install_modules_dependencies(s)

  # ---------- Fabric Components (when using frameworks) ----------
  if ENV['USE_FRAMEWORKS'] != nil && new_arch_enabled
    add_dependency(s, "React-FabricComponents", :additional_framework_paths => [
      "react/renderer/textlayoutmanager/platform/ios",
    ])
  end
end
