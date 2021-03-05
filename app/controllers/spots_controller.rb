class SpotsController < ApplicationController

  get "/spots" do
    redirect_if_not_logged_in
    @spots = Spot.all
    erb :"/spots/index"
  end

  get "/spots/new" do
    erb :"/spots/new.html"
  end

  post "/spots" do
    redirect "/spots"
  end

  get "/spots/:id" do
    redirect_if_not_logged_in
    @spot = Spot.find_by(id: params[:id])
    erb :"/spots/show"
  end

  get "/spots/:id/edit" do
    redirect_if_not_logged_in
    @users = User.all
    @spot = Spot.find_by(id: params[:id])
    erb :"/spots/edit"
  end

  patch "/spots/:id" do
    spot = Spot.find_by(id: params[:id])
    user = User.find_by(id: params[:user])
    spot.user = user
    user.spots << spot
    redirect "/spots"
  end

  patch "/spots/:id/unassign" do
    spot = Spot.find_by(id: params[:id])
    spot.update(user: nil)
    @spots = Spot.all
    redirect '/spots'
  end


end
