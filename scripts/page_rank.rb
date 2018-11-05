def page_rank
  puts "\nChecking pagerank for #{@url}..."
  puts "\nAnalysing Google Search resuls for #{@url}..."
  url = URI("https://openpagerank.com/api/v1.0/getPageRank?domains%5B%5D=#{@url}")
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(url)
  request["api-opr"] = 'wg0w8wsskcwog8w8ok48kgkwkog8cs080kcc4c4c'
  response = JSON.parse(http.request(request).read_body)
  rank = response['response'][0]['rank']
  if !(rank.empty?)
    puts "Google page rank: #{rank}".green
    puts "Pagerank PASS".green
    puts "Google Search PASS".green
    return 20
  else
    puts "Pagerank FAIL".red
    puts "Google Search FAIL".red
    return 0
  end
end
