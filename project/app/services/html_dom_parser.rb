class HtmlDomParser
  def self.parse(content)
    Nokogiri::HTML(content) do |config|
      config.strict.noblanks
    end
  end
end
