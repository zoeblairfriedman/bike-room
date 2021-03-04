require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
use Rack::Flash

configure do
    set(:views, 'app/views')
    set :public_folder, 'public'
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

  helpers do

      def current_user
        User.find_by(id: session[:user_id])
      end

      def redirect_if_not_logged_in
          redirect '/' unless current_user
      end

      def is_admin?
        current_user.name == "admin"
      end

      def check_owner(obj)
        obj && obj.user == current_user
      end

      def redirect_to_user_home
        flash[:message] = "You are not authorized to alter other user's bike information"
        redirect "/users/#{current_user.id}"
      end

      def can_alter
        check_owner(@bike) || (@bike && is_admin?)
      end
      

  end


end
