require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
use Rack::Flash

configure do
    set(:views, 'app/views')
    set :public_folder, './public/'
    enable :sessions
    set :session_secret, 'secret'
  end

  
  get "/" do
    if session[:user_id]
      redirect "/users/#{session[:user_id]}"
    else
      erb :welcome, :layout => :login_layout
    end
  end


end
