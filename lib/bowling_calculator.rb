require_relative 'bowling_class' # Require bowling_class.rb file

# Create an instance of BowlingScore class
bowling_score = BowlingScore.new

# Loop to take user input for rolls
10.times do |frame|
  puts "Frame #{frame + 1}: Enter roll 1 (0-10):"
  roll1 = gets.chomp.to_i
  bowling_score.roll(roll1)

  if roll1 < 10
    puts "Frame #{frame + 1}: Enter roll 2 (0-#{10 - roll1}):"
    roll2 = gets.chomp.to_i
    bowling_score.roll(roll2)
  else
    bowling_score.roll(0)
  end
end

# Calculate and display the final score
score = bowling_score.calculate_score
puts "Total Score: #{score}"
