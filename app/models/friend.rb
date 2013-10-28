class Friend
	attr_reader :facebook_id, :name, :picture_url

	def initialize _facebook_id, _name, _picture_url
		@facebook_id = _facebook_id
		@name = _name
		@picture_url = _picture_url
	end
end