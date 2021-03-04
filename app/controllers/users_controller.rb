class UsersController < ApplicationController

  get "/users" do
    redirect_if_not_logged_in
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
    if user.id
      session[:user_id] = user.id
      flash[:message] = "Sign up successful!"
      redirect "/users/#{user.id}"
    else
      flash[:message] = user.errors.full_messages.first
      erb :'users/signup'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
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
      flash[:message] = "Incorrect username or password"
      redirect 'users/login'
    end
  end

  get "/users/:id" do
    redirect_if_not_logged_in
    @user = User.find_by(id: params[:id])
    @bikes = @user.bikes
    @spots = @user.spots
    erb :"/users/show"
  end

  delete "/users/:id" do
    redirect_if_not_logged_in
    user = User.find_by(id: params[:id])
    if (current_user == user || is_admin?) && user
      user.bikes.clear
      user.spots.clear
      user.delete
      session.clear
    end
    if is_admin?
      redirect '/users' 
    else 
      redirect "/"
    end
  end
  

end
