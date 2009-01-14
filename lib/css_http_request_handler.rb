require "css_http_request"

class CssHttpRequestHandler < ActionView::TemplateHandler
  include CssHttpRequest
  
  def self.call(template)
    "CssHttpRequestHandler.new(self).render(template, local_assigns)"
  end
  
  def initialize(action_view)
    @action_view = action_view
  end

  def render(template, local_assigns = {})
    prepare_view(local_assigns)
    encode_chr(template.source)
  end

  private

  def prepare_view(local_assigns)
    @action_view.controller.headers["Content-Type"] ||= 'text/css'
    @action_view.controller.instance_variables.each do |v|
      instance_variable_set(v, @action_view.controller.instance_variable_get(v))
    end
  end
end

class CssJsonHttpRequestHandler < CssHttpRequestHandler
  def self.call(template)
    "CssJsonHttpRequestHandler.new(self).render(template, local_assigns)"
  end
  
  def render(template, local_assigns = {})
    prepare_view(local_assigns)
    output = eval(template.source, nil, '')
    encode_chr(output.to_json)
  end
end