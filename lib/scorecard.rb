class ScoreCard

  def initialize
    @score = 0
    @frames = []
    10.times { |each|
      @frames.push(
        {
          frame: each + 1,
          roll_one: {pins: nil, score: nil, bonus: '', bonus_score: nil, notes: ''},
          roll_two: {pins: nil, score: nil, bonus: '', bonus_score: nil, notes: ''}
          }
        )
    }

  end

  def controller
    10.times do |round|
      user_roll_one = gets.chomp
      @frames[round][:roll_one][:pins] = user_roll_one.to_i
      @frames[round][:roll_one][:score] = user_roll_one.to_i
      if user_roll_one == '10'
        @frames[round][:roll_one][:bonus] = 'strike'
        next
      else
        @frames[round][:roll_one][:pins] = user_roll_one.to_i
        @frames[round][:roll_one][:score] = user_roll_one.to_i
      end

      user_roll_two = gets.chomp
      if user_roll_two + user_roll_one == 10
        @frames[round][:roll_two][:bonus] = 'spare'
      end
        @frames[round][:roll_two][:pins] = user_roll_two.to_i
        @frames[round][:roll_two][:score] = user_roll_two.to_i
    end
  end

  def scorecard
    print %Q(
  | frame | roll | knocked pins | total score | bonus |
  |-------|------|--------------|-------------|-------|
)
    @frames.each do |frame|
      @score += (frame[:roll_one][:score] + frame[:roll_two][:score])
      space = ' ' if frame[:frame] < 10
      score_space = ' ' if @score < 10
      puts "  |  #{space}#{frame[:frame]}   |   1  |      #{frame[:roll_one][:pins]}       |             |  nil  |"
      puts "  |  #{space}#{frame[:frame]}   |   2  |      #{frame[:roll_two][:pins]}       |     #{score_space}#{score}      |  nil  |"
    end
  end

  attr_reader :score, :frames
end
