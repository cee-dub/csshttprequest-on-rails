Gem::Specification.new do |s|
  s.name = 'css_http_request'
  s.version = '1.0'
  s.date = '2008-12-23'
  
  s.summary = "CSSHttpRequest is cross-domain AJAX using CSS"
  s.description = "Like JavaScript includes, this works because CSS is not subject to the same-origin policy that affects XMLHttpRequest. CSSHttpRequest functions similarly to JSONP, and is limited to making GET requests. Unlike JSONP, untrusted third-party JavaScript cannot execute in the context of the calling page."
  
  s.authors = ['Cameron Walters', 'Randy Reddig']
  s.email = 'ping@nb.io'
  s.homepage = 'http://nb.io/hacks/csshttprequest/'
  
  s.has_rdoc = true
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["README"]

  s.add_dependency 'rails', ['>= 2.1']
  
  s.files = [
    "css_http_request.gemspec",
    "init.rb",
    "install.rb",
    "lib/css_http_request.rb",
    "MIT-LICENSE",
    "rails/init.rb",
    "Rakefile",
    "README.markdown",
    # "uninstall.rb",
  ]

end

