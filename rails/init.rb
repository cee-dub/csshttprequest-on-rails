require "css_http_request"
require "css_http_request_handler"

ActionController::Base.class_eval do
  send(:include, CssHttpRequest)
  send(:include, CssHttpRequestExt)
end
ActionController::Base.send :alias_method_chain, :render, :chr

ActionView::Template.register_template_handler :chr, CssHttpRequestHandler
ActionView::Template.register_template_handler :jsonc, CssJsonHttpRequestHandler
