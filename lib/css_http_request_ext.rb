module CssHttpRequestExt
  def self.included(klass)
    klass.prepend_before_filter :adjust_format_for_css_http_request
  end

  def adjust_format_for_css_http_request    
    request.format = :chr if css_http_request?
    request.format = :jsonc if json_css_http_request?
  end

  def css_http_request?
    return params[:format] == "chr"
  end

  def json_css_http_request?
    return params[:format] == "jsonc"
  end
  
  def render_with_chr(options = nil, extra_options = {}, &block)
    if options.is_a?(Hash) && options.has_key?(:chr)
      output = render_to_string(options.merge!(options.delete(:chr)), &block)
      render :text => output, :mime_type => Mime::Type.lookup_by_extension(params[:format])
    else
      render_without_chr(options, extra_options, &block)
    end
  end
end
