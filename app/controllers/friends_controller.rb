class FriendsController < ApplicationController
  def index
  	redirect_to session_new_path if session['access_token'].nil?
  	@friends = Fb::Friends.new(session['access_token']).list_20
  end
end
