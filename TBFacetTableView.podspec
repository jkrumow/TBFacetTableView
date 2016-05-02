Pod::Spec.new do |s|
  s.name             = "TBFacetTableView"
  s.version          = "1.0.1"
  s.summary          = "A UITableView with cells shaped like facets."
  s.description      = <<-DESC
                       A UITableView with cells shaped like facets. Facets can be highlighted.
                       DESC
  s.homepage         = "http://github.com/jkrumow/TBFacetTableView"
  s.license          = 'MIT'
  s.author           = { "Julian Krumow" => "julian.krumow@bogusmachine.com" }
  s.source           = { :git => "https://github.com/jkrumow/TBFacetTableView.git", :tag => s.version.to_s }
  s.screenshots      = ["https://raw.githubusercontent.com/jkrumow/TBFacetTableView/master/Documentation/Images/Screenshots/facets.png", "https://raw.githubusercontent.com/jkrumow/TBFacetTableView/master/Documentation/Images/Screenshots/facets_highlighted.png"]

  s.platform     = :ios, '5.0'
  s.ios.deployment_target = '5.0'
  s.requires_arc = true

  s.source_files = 'Classes/**/*.{h,m}'

end
