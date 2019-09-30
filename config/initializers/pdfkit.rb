PDFKit.configure do |config|
  config.wkhtmltopdf = "/home/brice/.rbenv/versions/2.5.3/bin/wkhtmltopdf"

  config.default_options = {
    encoding:"UTF-8",
    dpi: '300',
    margin_top: '70',
    margin_bottom: '20',
    margin_left: '20',
    margin_right: '20',
    header_spacing: '10',
    footer_spacing: '2',
    footer_center: 'Page [page] of [toPage]',
    quiet: true
  }
  end
