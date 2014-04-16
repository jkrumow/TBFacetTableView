Pod::Spec.new do |s|
  s.name             = "TBFacetTableView"
  s.version          = "0.1.0"
  s.summary          = "A UITableView with cells shaped like facets."
  s.description      = <<-DESC
                       A UITableView with cells shaped like facets.
                       DESC
  s.homepage         = "http://github.com/tarbrain/TBFacetTableView"
  s.license          = 'MIT'
  s.author           = { "Julian Krumow" => "julian.krumow@tarbrain.com" }
  s.source           = { :git => "https://github.com/tarbrain/TBFacetTableView.git", :tag => s.version.to_s }

  s.platform     = :ios, '5.0'
  s.ios.deployment_target = '5.0'
  s.requires_arc = true

  s.source_files = 'Classes/**/*.{h,m}'

end
