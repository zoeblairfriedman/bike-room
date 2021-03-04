class BikesController < ApplicationController

  get "/bikes" do
    redirect_if_not_logged_in
    @bikes = Bike.all
    erb :"/bikes/index"
  end

  get "/bikes/new" do
    redirect_if_not_logged_in
    erb :"/bikes/new"
  end

  post "/bikes" do
    @user = current_user
    @user.bikes.create(params[:bike])
    redirect_to_user_home
  end

  get "/bikes/:id" do
    redirect_if_not_logged_in
    @bike = Bike.find_by(id: params[:id])
    if @bike
      @user = @bike.user
      erb :"/bikes/show"
    else
      redirect '/bikes'
    end
  end

  get "/bikes/:id/edit" do
    redirect_if_not_logged_in
    @bike = Bike.find_by(id: params[:id])
    if can_alter
      erb :"/bikes/edit"
    else
      redirect_to_user_home
    end
  end

  patch "/bikes/:id" do
    redirect_if_not_logged_in
    @bike = Bike.find_by(id: params[:id])
    if can_alter
      @bike.update(params[:bike])
      redirect "/bikes/#{@bike.id}"
    else
      redirect_to_user_home
    end
  end

  delete "/bikes/:id" do
    redirect_if_not_logged_in
    @bike = Bike.find_by(id: params[:id])
    if can_alter
      @bike.delete
      redirect "/bikes"
    else
      redirect_to_user_home
    end
  end

end
