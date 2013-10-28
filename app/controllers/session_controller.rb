class SessionController < ApplicationController
  def new
  end

  def facebook_callback
  	connection = FB::Connection.new(params["code"], session_facebook_callback_url)
  	session['access_token'] = connection.access_token

  	redirect_to friends_index_path
  end

  def destroy
  	session['access_token'] = nil
  	redirect_to session_new_path
  end

end
