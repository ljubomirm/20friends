require 'net/http'
Dir["#{__dir__}/fb/*.rb"].each {|file| load file }

class FB
 	class << self
 		

 		def oauth_url redirect_uri
			"https://www.facebook.com/dialog/oauth?" +
    	"client_id=#{FACEBOOK_APP_ID}" +
    	"&redirect_uri=#{CGI.escape(redirect_uri)}"	
 		end
 	end

 	::Connection
 	::Friends
end
