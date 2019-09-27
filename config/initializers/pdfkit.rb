def config
PDFKit.configure do |config|
  config.wkhtmltopdf = "/home/brice/.rbenv/shims/wkhtmltopdf"

  config.default_options = {
    encoding:"UTF-8",
    dpi: '300',
    margin_top: '30',
    margin_bottom: '23',
    margin_left: '10',
    margin_right: '10',
    header_spacing: '10',
    footer_spacing: '2',
    footer_center: "Page [page] of [toPage]",
    quiet: true
  }
  end
end
