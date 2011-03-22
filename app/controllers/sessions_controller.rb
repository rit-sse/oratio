class SessionsController < ApplicationController
  def callback
    render :text => auth.inspect # Do what you want with the auth hash!
  end

  def auth; request.env['omniauth.auth'] end
end