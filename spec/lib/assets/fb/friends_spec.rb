require "spec_helper.rb"
require "./lib/assets/fb.rb"
require "./lib/assets/fb/friends.rb"
require "webmock/rspec"

describe Fb::Friends do
	context "Initialization" do

    before do
      @access_token = "fake_access_token"
      stub_request(:get, "https://graph.facebook.com/me/friends?fields=picture,name&access_token=#{@access_token}")
    end

    subject do 
    	fb_friends = Fb::Friends.new(@access_token)
    	fb_friends.stub(:to_array) { FB_DATA_ARRAY }
    	fb_friends
    end

	 	it "#list_20 should return an array of 20 friends with their names and avatar pictures" do
	    expect(subject.list_20).to have(20).items
	  end
	end
end