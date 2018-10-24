require 'net/http'

class WebContentFetcher
  attr_reader :url, :parser

  def initialize(url, parser = nil)
    @url = url
    @parser = parser
  end

  def call
    parser.present? ? parser.parse(content) : content
  end

  private

  def content
    content ||= Net::HTTP.get(uri)
  end

  def uri
    URI.parse(url)
  end
end
