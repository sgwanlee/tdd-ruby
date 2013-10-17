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
		before { competition.questions = [{:title => "Question"}]}
		subject { competition }

		it { should allow_teams_to_enter }	#without any string
	end
end