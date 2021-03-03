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
    erb :welcome
  end


end
