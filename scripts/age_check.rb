def age_check
  puts "\nChecking Domain age for #{@url}..."
  url = URI("https://api.jsonwhois.io/whois/domain?key=Zfe8V8zcLJYqfO2PLvY6ziMIUyljEqFd&domain=#{@url}")
  score = 0
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["content-type"] = 'multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW'
  request["key"] = 'Zfe8V8zcLJYqfO2PLvY6ziMIUyljEqFdZfe8V8zcLJYqfO2PLvY6ziMIUyljEqFd'
  request["domain"] = "#{@url}"
  request.body = "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"domain\"\r\n\r\nwww.google.com\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--"

  response = JSON.parse(http.request(request).read_body)
  date = ((Date.today - Date.parse(response['result']['created'])).to_i) rescue 0
  if date > 180
    score += 10
    puts "Domain registered on #{response['result']['created']}".green
    puts "Domain age check PASS".green
  else
    puts "Domain age check FAIL".red
  end
  puts "\nChecking Domain WHOIS for #{@url}..."
  if !((response['result']['contacts']).empty?)
    score += 10
    puts "Domain WHOIS #{response['result']['contacts']}".green
    puts "Domain WHOIS PASS".green
  else
    puts "Domain WHOIS check FAIL".red
  end
  return score
end
