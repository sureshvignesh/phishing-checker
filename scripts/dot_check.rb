def dot_check
  puts "\nChecking Dot operator for #{@url}..."
  if @url.count('.') > 3
    puts "Dot operator check FAIL".red
    return 0
  else
    puts "Dot operator check PASS".green
    return 10
  end
end
