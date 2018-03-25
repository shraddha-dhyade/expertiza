describe CollusionCycle do
  ###
  # Please do not share this file with other teams.
  # Use factories to `build` necessary objects.
  # Please avoid duplicated code as much as you can by moving the code to `before(:each)` block or separated methods.
  # RSpec tutorial video (until 9:32): https://youtu.be/dzkVfaKChSU?t=35s
  # RSpec unit tests examples: https://github.com/expertiza/expertiza/blob/3ce553a2d0258ea05bced910abae5d209a7f55d6/spec/models/response_spec.rb
  ###

  #
  # assignment participant ────┐
  #    ∧                       │
  #    │                       v
  #    └───────────────────── current reviewer (ap)
  #

  let(:response) { build(:response) }
  let(:team) { build(:assignment_team, id: 1) }
  let(:response_map) { build(:review_response_map, id: 1) }
  let(:participant) { build(:participant, id: 1) }
  let(:participant2) { build(:participant, id: 2) }
  let(:participant3) { build(:participant, id: 3) }
  let(:participant4) { build(:participant, id: 4) }
  let(:assignment) { build(:assignment, id: 1) }
  
  before(:each) do
    allow(participant).to receive(:team).and_return(team)
    @cycle = CollusionCycle.new()
  end

  describe '#two_node_cycles' do
    context 'when the reviewers of current reviewer (ap) does not include current assignment participant' do
      it 'skips this reviewer (ap) and returns corresponding collusion cycles' do
        #Sets up variables for test
        participant.assignment = assignment
        participant2.grade = 90
        
        team.assignment = assignment
        
        response_map.assignment = assignment
        response_map.response = [response]
        response_map.reviewer = participant2
        response_map.reviewee = team
        
        puts response_map.inspect
        
        expect(@cycle.two_node_cycles(participant)).to eql([])
      end
    end

    context 'when the reviewers of current reviewer (ap) includes current assignment participant' do
      context 'when current assignment participant was not reviewed by current reviewer (ap)' do
        it 'skips current reviewer (ap) and returns corresponding collusion cycles' do
       #   expect(@cycle.two_node_cycles(participant)).to eql([])
        end
      end

      context 'when current assignment participant was reviewed by current reviewer (ap)' do
        it 'inserts related information into collusion cycles and returns results' do
         # expect(@cycle.two_node_cycles())
        end
      end

      context 'when current reviewer (ap) was not reviewed by current assignment participant' do
        it 'skips current reviewer (ap) and returns corresponding collusion cycles'
        # Write your test here!
      end

      context 'when current reviewer (ap) was reviewed by current assignment participant' do
        it 'inserts related information into collusion cycles and returns results'
        # Write your test here!
      end
    end
  end

  #
  # assignment participant ────┐
  #    ∧                       │
  #    │                       v
  # current reviewee (ap1) <─ current reviewer (ap2)
  #
  describe '#three_node_cycles' do
    context 'when the reviewers of current reviewer (ap2) does not include current assignment participant' do
      it 'skips this reviewer (ap2) and returns corresponding collusion cycles'
      # Write your test here!
    end

    context 'when the reviewers of current reviewer (ap2) includes current assignment participant' do
      context 'when current assignment participant was not reviewed by current reviewee (ap1)' do
        it 'skips current reviewer (ap2) and returns corresponding collusion cycles'
        # Write your test here!
      end

      context 'when current assignment participant was reviewed by current reviewee (ap1)' do
        it 'inserts related information into collusion cycles and returns results'
        # Write your test here!
      end

      context 'when current reviewee (ap1) was not reviewed by current reviewer (ap2)' do
        it 'skips current reviewer (ap2) and returns corresponding collusion cycles'
        # Write your test here!
      end

      context 'when current reviewee (ap1) was reviewed by current reviewer (ap2)' do
        it 'inserts related information into collusion cycles and returns results'
        # Write your test here!
      end

      context 'when current reviewer (ap2) was not reviewed by current assignment participant' do
        it 'skips current reviewer (ap2) and returns corresponding collusion cycles'
        # Write your test here!
      end

      context 'when current reviewer (ap2) was reviewed by current assignment participant' do
        it 'inserts related information into collusion cycles and returns results'
        # Write your test here!
      end
    end
  end

  #
  #             assignment participant ─> current reviewer (ap3)
  #                                ∧       │
  #                                │       v
  # reviewee of current reviewee (ap1) <─ current reviewee (ap2)
  #
  describe '#four_node_cycles' do
    context 'when the reviewers of current reviewer (ap3) does not include current assignment participant' do
      it 'skips this reviewer (ap3) and returns corresponding collusion cycles'
      # Write your test here!
    end

    context 'when the reviewers of current reviewer (ap3) includes current assignment participant' do
      context 'when current assignment participant was not reviewed by the reviewee of current reviewee (ap1)' do
        it 'skips current reviewer (ap3) and returns corresponding collusion cycles'
        # Write your test here!
      end

      context 'when current assignment participant was reviewed by the reviewee of current reviewee (ap1)' do
        it 'inserts related information into collusion cycles and returns results'
        # Write your test here!
      end

      context 'when the reviewee of current reviewee (ap1) was not reviewed by current reviewee (ap2)' do
        it 'skips current reviewer (ap3) and returns corresponding collusion cycles'
        # Write your test here!
      end

      context 'when the reviewee of current reviewee (ap1) was reviewed by current reviewee (ap2)' do
        it 'inserts related information into collusion cycles and returns results'
        # Write your test here!
      end

      context 'when current reviewee (ap2) was not reviewed by current reviewer (ap3)' do
        it 'skips current reviewer (ap3) and returns corresponding collusion cycles'
        # Write your test here!
      end

      context 'when current reviewee (ap2) was reviewed by current reviewer (ap3)' do
        it 'inserts related information into collusion cycles and returns results'
        # Write your test here!
      end

      context 'when current reviewer (ap3) was not reviewed by current assignment participant' do
        it 'skips current reviewer (ap3) and returns corresponding collusion cycles'
        # Write your test here!
      end

      context 'when current reviewer (ap3) was reviewed by current assignment participant' do
        it 'inserts related information into collusion cycles and returns results'
        # Write your test here!
      end
    end
  end

  describe '#cycle_similarity_score' do
    it 'returns similarity score based on inputted cycle'
    # Write your test here!
  end

  describe '#cycle_deviation_score' do
    it 'returns cycle deviation score based on inputted cycle'
    # Write your test here!
  end
end
