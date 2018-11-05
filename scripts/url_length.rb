def url_length
  puts "\nChecking URL length for #{@url}..."
  puts "URL length: #{@url}.length"
  return @url.length > 60 ? 0 : 10
end
