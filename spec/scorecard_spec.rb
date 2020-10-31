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
        expect(frame[:roll_one]).to eq({pins: nil, score: nil, bonus: nil, notes: ''})
        expect(frame[:roll_one]).to eq({pins: nil, score: nil, bonus: nil, notes: ''})
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
  end

  pending ' #spare'



  pending ' #spare_bonus'



  pending ' #strike'



  pending ' #strike_bonus'




end
