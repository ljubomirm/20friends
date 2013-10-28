class Friends

	def initialize(access_token)
		@data = Net::HTTP.get(URI("https://graph.facebook.com/me/friends?fields=picture,name&access_token=#{access_token}"))
	end

	def to_array
		ActiveSupport::JSON.decode(@data)["data"]
	end
	
	def list_20
		data = to_array
		return [] if data.nil?
		list = []
		(1..20).each do |i|
			current = data[i]
			list << Friend.new(current["id"], current["name"], current["picture"]["data"]["url"])
		end
		list
	end
end