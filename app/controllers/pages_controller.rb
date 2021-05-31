class PagesController < ApplicationController
  def index
    @spaces = []
    orgid = "-MA1LVuAa2r7iEH23aFf"    
    token = "YTZRcjdDMHhldmcxZWx0ejZmMXhjN3NOVnRuMjotTUE1Znlpb0NoZGVFRFZWMDRVUi0tTUE1ZnlpcER3eURKNkU2ajNyXw=="

    url = "https://api-beta.gitbook.com/v1/owners/#{orgid}/spaces"
    encoded_url = URI.encode(url)

    response = HTTParty.get(encoded_url,  headers: {
    Authorization: "Bearer #{token}"
    })

    parsed_response = JSON.parse(response.body)

    parsed_response['items'].each do |space|
      @spaces.push(space['baseName'])
    end
  end
end
