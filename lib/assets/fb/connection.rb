class Connection
	attr_accessor :connection, :access_token

	def initialize(code, redirect_uri)
		@connection = Net::HTTP.get(URI("https://graph.facebook.com/oauth/access_token?client_id=#{FACEBOOK_APP_ID}&client_secret=#{FACEBOOK_APP_SECRET}&code=#{code}&redirect_uri=#{CGI.escape(redirect_uri)}"))
		@access_token = @connection.split('&').first.split('=').last
	end
end