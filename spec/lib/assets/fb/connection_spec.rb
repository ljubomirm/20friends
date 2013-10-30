require  "./lib/assets/fb.rb"
require  "./lib/assets/fb/connection.rb"
# require "./config/initializers/facebook_init.rb"
require "webmock/rspec"

describe Fb::Connection do
	context "Initialization" do

    before do
      @code = "fake_facebook_callback_code"
      @redirect_uri = "http://dlabs-test.herokuapp.com/session/facebook_callback"
      stub_request(:get, "https://graph.facebook.com/oauth/access_token?client_id=#{FACEBOOK_APP_ID}&client_secret=#{FACEBOOK_APP_SECRET}&code=#{@code}&redirect_uri=#{CGI.escape(@redirect_uri)}")
        .to_return(:body => "access_token=fake_access_token&something_else")
    end

    subject do
      connection = Fb::Connection.new(@code, @redirect_uri)
    end
    
    it "should parse access token" do
    	expect(subject.access_token).to eq('fake_access_token')
    end
  end
end