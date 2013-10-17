require './lib/competition.rb'
require './lib/team.rb'
require './spec/support/matchers/team_support.rb'

describe Competition do
	let(:competition)	{ Competition.new }
	let(:team)	{ Team.new("Random name")}

	context "having no question" do
		# before { competition.questions = [] }
		before { competition.stub(:questions => []) }

		it "doesn't accept any teams" do
			competition.should_not allow_teams_to_enter
			# expect do
			# 	team.enter_competition(competition)
			# end.to raise_error Competition::Closed
		end
	end

	context "having questions" do
		# before { competition.questions = [{:title => "Question"}]}
		before { competition.stub(:questions => [ stub ])}	#We don't know how 'questions' looks like. We can remove dependency by using stub!
		subject { competition }

		it { should allow_teams_to_enter }	#without any string
	end

	context "when started" do
		it "is closed" do
			competition.should_receive(:close)	#:close is a message
																					# mock is not for testing implementation. No need to build, just call it.
			competition.start
		end
	end
end