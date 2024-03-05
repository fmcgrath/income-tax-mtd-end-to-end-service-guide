require 'govuk_tech_docs'

require 'uri'
require 'net/http'

GovukTechDocs.configure(self)

set :relative_links, true
activate :relative_assets

helpers do
  def make_a_link(apiname, anchor, text)
    url = "https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/#{apiname}/"
    response = fetch(url, 10)
    link = "<a href='#{response}##{anchor}'>#{text}</a>"

    link
  end
  def fetch(uri_str, limit = 10)

    puts uri_str
    # You should choose a better exception.
    raise ArgumentError, 'too many HTTP redirects' if limit == 0

    response = Net::HTTP.get_response(URI(uri_str))

    case response
    when Net::HTTPSuccess then
      "#{response['location']}/oas/page"
    when Net::HTTPRedirection then

      puts "redirected to #{response['location']}"
      location = response['location']
      array = location.split('/')
      version = array[array.length - 1]
      "#{uri_str}/#{version}/oas/page"
    else
      uri_str
    end
  end


end