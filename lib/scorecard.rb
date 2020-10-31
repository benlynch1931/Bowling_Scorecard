class ScoreCard

  def initialize
    @score = 0
    @frames = []
    10.times { |each|
      @frames.push(
        {
          frame: each + 1,
          roll_one: {pins: '  ', score: 0, bonus: '', bonus_score: 0, notes: ''},
          roll_two: {pins: '  ', score: 0, bonus: '', bonus_score: 0, notes: ''}
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
      if user_roll_two.to_i + user_roll_one.to_i == 10
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
    @frames.each_with_index do |frame, idx|
      bonus(idx)
      @score += (frame[:roll_one][:score] + frame[:roll_two][:score] + frame[:roll_one][:bonus_score] + frame[:roll_two][:bonus_score])
      space = ' ' if frame[:frame] < 10
      score_space = ' ' if @score < 100
      score_space = '  ' if @score < 10
      pins_space = ' ' if frame[:roll_one][:pins].kind_of?(Integer) && frame[:roll_one][:pins] < 10
      puts "  |  #{space}#{frame[:frame]}   |   1  |     #{pins_space}#{frame[:roll_one][:pins]}       |             |  nil  |"
      puts "  |  #{space}#{frame[:frame]}   |   2  |     #{pins_space}#{frame[:roll_two][:pins]}       |    #{score_space}#{score}      |  nil  |"
    end
  end

  def bonus(idx)
    if @frames[idx][:roll_one][:bonus] == 'strike'
      strike_bonus(idx+1)
      @frames[idx][:roll_one][:bonus_score] = (@frames[idx + 1][:roll_one][:score] + @frames[idx + 1][:roll_two][:score])
    elsif @frames[idx][:roll_two][:bonus] == 'spare'
      @frames[idx][:roll_one][:bonus_score] = @frames[idx + 1][:roll_one][:score]
    end
  end

  def strike_bonus(idx)
    if @frames[idx][:roll_one][:bonus] == 'strike'
      strike_bonus(idx+1)
      @frames[idx][:roll_one][:bonus_score] = (@frames[idx + 1][:roll_one][:score] + @frames[idx + 1][:roll_two][:score])
    end
  end

  attr_reader :score, :frames
end
