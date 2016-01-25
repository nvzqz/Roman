Pod::Spec.new do |s|
    s.name                      = "Roman"
    s.version                   = "1.1.0"
    s.summary                   = "Seamless Roman numeral conversion in Swift."
    s.homepage                  = "https://github.com/nvzqz/Roman"
    s.license                   = { :type => "MIT", :file => "LICENSE.txt" }
    s.author                    = "Nikolai Vazquez"
    s.ios.deployment_target     = "8.0"
    s.osx.deployment_target     = "10.9"
    s.watchos.deployment_target = '2.0'
    s.tvos.deployment_target    = '9.0'
    s.source                    = { :git => "https://github.com/nvzqz/Roman.git", :tag => "v#{s.version}" }
    s.source_files              = "Sources/*.swift"
end
