require "css_http_request"

ActionController::Base.class_eval do
  send(:include, CssHttpRequest)
  send(:include, CssHttpRequestExt)
end
