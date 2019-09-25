def config
PDFKit.configure do |config|
  config.wkhtmltopdf = "/usr/local/bin/wkhtmltopdf"

  config.default_options = {
    encoding:"UTF-8",
    dpi: '300',
    margin_top: '30',
    margin_bottom: '23',
    margin_left: '10',
    margin_right: '10',
    header_spacing: '10',
    # header_html: render_header_footer("header"),
    footer_spacing: '2',
    # footer_html: render_header_footer("footer"),
    quiet: true
  }
end
end

# def render_header_footer(type)
#   compiled = ERB.new(File.read("#{Rails.root}/app/views/reservations/#{type}.html.erb")).result(binding)
#   file = Tempfile.new(["#{type}",".html"])
#   file.write(compiled)
#   file.rewind
#   file.path
# end
