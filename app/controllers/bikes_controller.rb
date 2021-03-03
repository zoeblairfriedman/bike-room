class BikesController < ApplicationController

  get "/bikes" do
    @bikes = Bike.all
    erb :"/bikes/index"
  end

  get "/bikes/new" do
    erb :"/bikes/new"
  end

  post "/bikes" do
    @user = User.find_by(id: session[:user_id])
    @user.bikes.create(params[:bike])
    redirect "/users/#{@user.id}"
  end

  get "/bikes/:id" do
    @bike = Bike.find_by(id: params[:id])
    @user = @bike.user
    erb :"/bikes/show"
  end

  get "/bikes/:id/edit" do
    @bike = Bike.find_by(id: params[:id])
    erb :"/bikes/edit"
  end

  patch "/bikes/:id" do
    bike = Bike.find_by(id: params[:id])
    bike.update(params[:bike])
    redirect "/bikes/#{bike.id}"
  end

  delete "/bikes/:id" do
    bike = Bike.find_by(id: params[:id])
    bike.delete
    redirect "/users/#{bike.user.id}"
  end
  
end
