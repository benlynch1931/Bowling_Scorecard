# frozen_string_literal: true

class ScoreCard
  def initialize
    @score = 0
    @frames = []
    10.times do |each|
      @frames.push(
        {
          frame: each + 1,
          roll_one: { pins: '  ', score: 0, bonus: ' nil  ', bonus_score: 0, notes: '' },
          roll_two: { pins: '  ', score: 0, bonus: ' nil  ', bonus_score: 0, notes: '' }
        }
      )
    end
  end

  def controller
    10.times do |round|
      user_roll_one = gets.chomp
      @frames[round][:roll_one][:pins] = user_roll_one.to_i
      @frames[round][:roll_one][:score] = user_roll_one.to_i
      # puts @frames[round][:roll_one][:score] if round == 9
      if user_roll_one == '10'
        @frames[round][:roll_one][:bonus] = 'strike'
        # puts "#{round + 1}: STRIKE"
        next unless round == 9
      else
        @frames[round][:roll_one][:pins] = user_roll_one.to_i
        @frames[round][:roll_one][:score] = user_roll_one.to_i
      end

      user_roll_two = gets.chomp
      # puts "#{round + 1} : #{user_roll_one.to_i + user_roll_two.to_i}"
      @frames[round][:roll_two][:bonus] = 'spare ' if user_roll_one.to_i + user_roll_two.to_i == 10
      @frames[round][:roll_two][:pins] = user_roll_two.to_i
      @frames[round][:roll_two][:score] = user_roll_two.to_i
      # puts "#{@frames[round][:roll_one]}" unless round == 9
      # puts "#{@frames[round][:roll_two]}" unless round == 9
      next unless round == 9
      if @frames[round][:roll_one][:bonus] == 'strike' || @frames[round][:roll_two][:bonus] == 'spare '
        user_roll_three = gets.chomp
        # puts "#{@frames[round][:roll_one]}"
        # puts "#{@frames[round][:roll_two]}"
        @frames[round][:roll_three] = { pins: user_roll_three.to_i, score: user_roll_three.to_i, bonus: ' nil  ', bonus_score: 0, notes: '' } unless user_roll_three == ''
      end
    end
  end

  def scorecard
    # 9.times { |ea| puts "#{ea + 1}: #{@frames[ea][:roll_one]}\n#{@frames[ea][:roll_two]}"}
    # puts "#{10}: #{@frames[9][:roll_one]}\n#{@frames[9][:roll_two]}\n#{@frames[9][:roll_three]}"
    print %(
  | frame | roll | knocked pins | total score |  bonus  |
  |-------|------|--------------|-------------|---------|
)
    @frames.each_with_index do |frame, idx|
      bonus(idx) if idx < 9
      extra = 0
      extra = frame[:roll_three][:score] if frame[:roll_three]
      @score += (frame[:roll_one][:score] + frame[:roll_two][:score] + frame[:roll_one][:bonus_score] + frame[:roll_two][:bonus_score]) + extra
      space = ' ' if frame[:frame] < 10
      score_space = ' ' if @score < 100
      score_space = '  ' if @score < 10
      pins_space = ' ' if frame[:roll_one][:pins].is_a?(Integer) && frame[:roll_one][:pins] < 10
      bonus_str = frame[:roll_one][:bonus]
      puts "  |  #{space}#{frame[:frame]}   |   1  |     #{pins_space}#{frame[:roll_one][:pins]}       |             |  #{bonus_str} |"
      bonus_str = frame[:roll_two][:bonus]
      if frame[:roll_three]
        pins_space = ' ' if frame[:roll_two][:pins].is_a?(Integer) && frame[:roll_two][:pins] < 10
        puts "  |  #{space}#{frame[:frame]}   |   2  |     #{pins_space}#{frame[:roll_two][:pins]}       |             |  #{bonus_str} |"
        bonus_str = frame[:roll_three][:bonus]
        pins_space = ' ' if frame[:roll_three][:pins].is_a?(Integer) && frame[:roll_three][:pins] < 10
        puts "  |  #{space}#{frame[:frame]}   |   3  |     #{pins_space}#{frame[:roll_three][:pins]}       |    #{score_space}#{score}      |  #{bonus_str} |"
      else
        puts "  |  #{space}#{frame[:frame]}   |   2  |     #{pins_space}#{frame[:roll_two][:pins]}       |    #{score_space}#{score}      |  #{bonus_str} |"
      end
    end
  end

  def bonus(idx)
    if @frames[idx][:roll_one][:bonus] == 'strike'
      strike_bonus(idx + 1)
      @frames[idx][:roll_one][:bonus_score] = (@frames[idx + 1][:roll_one][:score] + @frames[idx + 1][:roll_two][:score])
    elsif @frames[idx][:roll_two][:bonus] == 'spare '
      @frames[idx][:roll_one][:bonus_score] = @frames[idx + 1][:roll_one][:score]
    end
  end

  def strike_bonus(idx)
    if @frames[idx][:roll_one][:bonus] == 'strike'
      return if idx == 9
      strike_bonus(idx + 1)
      @frames[idx][:roll_one][:bonus_score] = (@frames[idx + 1][:roll_one][:score] + @frames[idx + 1][:roll_two][:score])
    end
  end

  attr_reader :score, :frames
end
