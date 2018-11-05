def alexa_rank
  puts "\nChecking Alexa Rank for #{@url}..."
  url = URI("http://data.alexa.com/data?cli=10&dat=s&url=vakilsearch.com")
  http = Net::HTTP.new(url.host, url.port)
  request = Net::HTTP::Get.new(url)
  response = Nokogiri::XML(http.request(request).read_body)
  rank = response.at_xpath('//REACH').attributes['RANK'].value
  if !!rank
    puts "Alexa rank: #{rank}"
    puts "Alexa rank PASS".green
    return 10
  else
    puts "Alexa Rank FAIL".red
    return 0
  end
end
