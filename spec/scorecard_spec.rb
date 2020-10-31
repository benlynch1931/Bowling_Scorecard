require 'scorecard'

describe ScoreCard do

  context ' #initialize' do

    it 'instantiates with a score variable' do
      expect(subject.score).to eq 0
    end

    it 'instanties with a frames array' do
      frames = subject.frames
      frames.each_with_index do |frame, idx|
        expect(frame[:frame]).to eq(idx)
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

  pending ' #spare'



  pending ' #spare_bonus'



  pending ' #strike'



  pending ' #strike_bonus'




end
