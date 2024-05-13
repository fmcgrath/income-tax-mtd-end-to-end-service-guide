require 'nokogiri'
require 'open-uri'
require 'yaml'

# Fetch the HTML content from the URL
url = 'https://developer.service.hmrc.gov.uk/api-documentation/docs/api?filter=income-tax-mtd'
doc = Nokogiri::HTML(URI.open(url))

# Find all the hyperlinks where the anchor text ends with "(MTD)"
links = doc.css('a[href]').select { |link| link.text.strip.end_with?('(MTD)') }

# Open the output file
File.open('api-list.md', 'w') do |file|
  # Process each link
  links.each do |link|
    # Fetch the HTML content of the page at the URL
    link_url = URI.join('https://developer.service.hmrc.gov.uk', link['href']).to_s
    link_doc = Nokogiri::HTML(URI.open(link_url))

    # Find the anchor element with the content "View API endpoints"
    api_endpoints_link = link_doc.at('a:contains("View API endpoints")')

    # Extract the URL of the anchor element
    if api_endpoints_link
      api_endpoints_url = URI.join('https://developer.service.hmrc.gov.uk', api_endpoints_link['href']).to_s
      resolved_url = api_endpoints_url.gsub('/page', '/resolved')

      # Check versions
      version_number = link_url.split('/').last
      production_element = link_doc.at('th:contains("Available in Production")')
      if production_element
        production_status = production_element.next_element.text.strip
        if production_status == "Yes"
          prod_version_number = version_number
          sandbox_version_number = version_number
        else
          sandbox_version_number = version_number
          prod_version_number = 'N/A'
          
          # Parse the URL with one version less
          current_version = version_number.to_f
          while current_version > 1.0
            current_version -= 1.0
            previous_version_url = link_url.gsub(version_number, current_version.to_s)
            previous_version_doc = Nokogiri::HTML(URI.open(previous_version_url))
            
            previous_production_element = previous_version_doc.at('th:contains("Available in Production")')
            if previous_production_element
              previous_production_status = previous_production_element.next_element.text.strip
              if previous_production_status == "Yes"
                prod_version_number = current_version.to_s
                break
              end
            end
          end
        end
      end

      begin
        # Fetch the YAML content from the resolved URL
        yaml_content = URI.open(resolved_url).read
        yaml_data = YAML.safe_load(yaml_content, permitted_classes: [Date, Time])

        # Extract and write the "summary" elements to the output file
        puts "- API: [#{link.text.strip}](#{link_url}) (Sandbox: #{sandbox_version_number}, Production: #{prod_version_number})"
        file.puts "- API: [#{link.text.strip}](#{link_url}) (Sandbox: #{sandbox_version_number}, Production: #{prod_version_number})"
        yaml_data['paths'].each do |path, methods|
          methods.each do |method, details|
            puts "  - Endpoint: #{details['summary']}"
            file.puts "  - Endpoint: #{details['summary']}"
          end
        end
        file.puts ""
      rescue OpenURI::HTTPError => e
        puts "Error fetching YAML content for #{resolved_url}: #{e.message}"
      rescue Psych::SyntaxError => e
        puts "Error parsing YAML content for #{resolved_url}: #{e.message}"
      end
    else
      puts "No 'View API endpoints' link found for #{link_url}"
    end
  end
end