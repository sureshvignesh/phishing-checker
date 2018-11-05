Dir["scripts/*.rb"].each {|file| require_relative file }

class Checker

  def initialize(url)
    @url = url
    @score = 0
  end

  def check
    puts "\n\nAnalysing Phising algorithm for #{@url}".yellow
    raise ('Enter a valid URL').red if !(@url =~ URI::regexp)
    puts ("-"*50).yellow
    @score += page_rank
    @score += alexa_rank
    @score += dot_check
    @score += age_check
    @score += url_length
    @score += fav_icon
    puts "\n\n #{@url} is #{(@score.to_f / 70.to_f * 100).round(2)}% safe".test
  end

end
website = Checker.new(ARGV[0]).check
