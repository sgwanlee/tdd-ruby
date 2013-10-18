require_relative 'spec_helper.rb'
require_relative '../lib/team.rb'
require_relative '../lib/player.rb'


describe Team do
	it 'has a name' do
		Team.new("Random name").should respond_to :name
	end

	it 'has a list of players' do
		Team.new("Random name").players.should be_kind_of Array
	end

	it 'is favored if it has a celebrity in it' do
		Team.new("Random name", ["George Clooney"]).should be_favored
	end

	it 'complains if there is a bad word in the name' do
		expect { Team.new("Crappy name")}.to raise_error
	end

	context "given a bad list of players" do
		let(:bad_players) { {} }

		it "fails to create given a bad player list" do
			expect { Team.new("Random name", bad_players)}.to raise_error
		  
		end
	end

	context "having a tag" do
		let(:team) { Team.new("Ruby team", [], tag: "ruby")}

		it "only accepts members that match its tag" do
			VCR.use_cassette "twitter-josemotanet" do
				rubyist = Player.new "Jose Mota", twitter: "josemotanet"
				team.allows_player_to_join?(rubyist).should == true
			end
		end

		it "reject members that doesn't macht its tag" do
			VCR.use_cassette "twitter-jeffrey_way" do			
				not_rubyist = Player.new "Jeffrey Way", twitter: "jeffrey_way"
				team.allows_player_to_join?(not_rubyist).should == false
			end
		end
	end
end