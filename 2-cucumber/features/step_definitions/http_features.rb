require 'net/http'

Given(/^the http URL "(.*?)"$/) do |http_url|
  @http_url = http_url
end

When(/^a request is made$/) do
  @http_code = 0
  uri = URI.parse(@http_url)
  
  http = Net::HTTP.new(uri.host, uri.port)
  if uri.port == 443
    http.use_ssl = true
  end

  req = Net::HTTP::Get.new(uri.request_uri)
  res = http.request(req)

  res_hash = res.to_hash
  if res_hash.key?('location')
    @redirect_url = res_hash['location'][0]
  else
    @redirect_url = '<nowhere>'
  end
  @http_code = res.code
end

Then(/^the response http_code should be "(.*?)"$/) do |expected_http_code|
  expect(@http_code).to eq(expected_http_code)
end

And(/^I should be redirected to "(.*?)"$/) do |expected_redirect_url|
  expect(@redirect_url).to eq(expected_redirect_url)
end
