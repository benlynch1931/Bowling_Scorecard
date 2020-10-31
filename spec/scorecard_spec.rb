require 'scorecard'

describe ScoreCard do

  simple_scorecard = %Q(
  | frame | roll | knocked pins | total score | bonus |
  |-------|------|--------------|-------------|-------|
  |   1   |   1  |      4       |             |  nil  |
  |   1   |   2  |      5       |      9      |  nil  |
  |   2   |   1  |      3       |             |  nil  |
  |   2   |   2  |      1       |     13      |  nil  |
  |   3   |   1  |      4       |             |  nil  |
  |   3   |   2  |      5       |     22      |  nil  |
  |   4   |   1  |      3       |             |  nil  |
  |   4   |   2  |      1       |     26      |  nil  |
  |   5   |   1  |      4       |             |  nil  |
  |   5   |   2  |      5       |     35      |  nil  |
  |   6   |   1  |      3       |             |  nil  |
  |   6   |   2  |      1       |     39      |  nil  |
  |   7   |   1  |      4       |             |  nil  |
  |   7   |   2  |      5       |     48      |  nil  |
  |   8   |   1  |      3       |             |  nil  |
  |   8   |   2  |      1       |     52      |  nil  |
  |   9   |   1  |      4       |             |  nil  |
  |   9   |   2  |      5       |     61      |  nil  |
  |  10   |   1  |      3       |             |  nil  |
  |  10   |   2  |      1       |     65      |  nil  |
)

  context ' #initialize' do

    it 'instantiates with a score variable' do
      expect(subject.score).to eq 0
    end

    it 'instanties with a frames array' do
      frames = subject.frames
      frames.each_with_index do |frame, idx|
        expect(frame[:frame]).to eq(idx + 1)
        expect(frame[:roll_one]).to eq({pins: nil, score: nil, bonus: '', bonus_score: nil, notes: ''})
        expect(frame[:roll_one]).to eq({pins: nil, score: nil, bonus: '', bonus_score: nil, notes: ''})
      end
    end
  end

  context ' #controller' do

    it 'responds when called' do
      expect(subject).to respond_to(:controller)
    end

    context 'when strike rolled' do

      it 'adds 10 points to the frames array' do
        allow(subject).to receive(:gets).and_return('10')
        subject.controller
        expect(subject.frames[0][:roll_one][:score]).to eq 10
      end

      it 'adds 10 pins to the frames array' do
        allow(subject).to receive(:gets).and_return('10')
        subject.controller
        expect(subject.frames[0][:roll_one][:pins]).to eq 10
      end
    end

    context 'roll_one' do
      it 'adds pins and score to frames array' do
        allow(subject).to receive(:gets).and_return('5')
        subject.controller
        expect(subject.frames[0][:roll_one][:pins]).to eq 5
        expect(subject.frames[0][:roll_one][:score]).to eq 5
      end
    end

    context 'roll_two' do
      it 'adds pins and score to frames array' do
        allow(subject).to receive(:gets).and_return('0','5')
        subject.controller
        expect(subject.frames[0][:roll_two][:pins]).to eq 5
        expect(subject.frames[0][:roll_two][:score]).to eq 5
      end
    end

    context 'multiple frames' do
      it 'iterates through frames like a real game' do
        allow(subject).to receive(:gets).and_return('4', '5', '3', '1')
        subject.controller
        expect(subject.frames[0][:roll_one]).to eq({pins: 4, score: 4, bonus: '', bonus_score: nil, notes: ''})
        expect(subject.frames[0][:roll_two]).to eq({pins: 5, score: 5, bonus: '', bonus_score: nil, notes: ''})
        expect(subject.frames[1][:roll_one]).to eq({pins: 3, score: 3, bonus: '', bonus_score: nil, notes: ''})
        expect(subject.frames[1][:roll_two]).to eq({pins: 1, score: 1, bonus: '', bonus_score: nil, notes: ''})
      end
    end
  end

  context ' #print_scorecard' do
    it "prints all info about frames. NO SPARE/STRIKE" do
      allow(subject).to receive(:gets).and_return('4', '5', '3', '1', '4', '5', '3', '1', '4', '5', '3', '1', '4', '5', '3', '1', '4', '5', '3', '1')
      subject.controller
      expect { subject.scorecard }.to output(simple_scorecard).to_stdout
    end
  end




end
