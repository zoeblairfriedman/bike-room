class UsersController < ApplicationController

  get "/users" do
    @users = User.all
    erb :"/users/index"
  end

  get '/signup' do
    if session[:user_id]
      redirect "/users/#{session[:user_id]}"
    end
    erb :'users/signup'
  end

  post '/signup' do
    user = User.create(params[:user])
    session[:user_id] = user.id
    redirect "/users/#{u.id}"
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

  get '/login' do
    if session[:user_id]
      redirect "/users/#{session[:user_id]}"
    end
    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      # flash[:message] = "Please try again."
      erb :'users/login'
    end
  end

#WONT WORK?   <% if flash.has?(:message) %>
#   <%= flash[:message] %>
# <% end %> 

  get "/users/:id" do
    @user = User.find_by(id: params[:id])
    erb :"/users/show"
  end



end
