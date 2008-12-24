module CssHttpRequestExt
  def self.included(klass)
    klass.prepend_before_filter :adjust_format_for_css_http_request
  end

  def adjust_format_for_css_http_request    
    request.format = :chr if css_http_request?
    request.format = :jsonc if css_http_request_as_json?
  end

  def css_http_request?
    return params[:format] == "chr"
  end

  def css_http_request_as_json?
    return params[:format] == "jsonc"
  end
end
