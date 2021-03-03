class SpotsController < ApplicationController

  # GET: /spots
  get "/spots" do
    @spots = Spot.all
    erb :"/spots/index"
  end

  # GET: /spots/new
  get "/spots/new" do
    erb :"/spots/new.html"
  end

  post "/spots" do
    redirect "/spots"
  end

  # GET: /spots/5
  get "/spots/:id" do
    @spot = Spot.find_by(id: params[:id])
    erb :"/spots/show"
  end

  # GET: /spots/5/edit
  get "/spots/:id/edit" do
    @users = User.all
    @spot = Spot.find_by(id: params[:id])
    erb :"/spots/edit"
  end

  # PATCH: /spots/5
  patch "/spots/:id" do
    spot = Spot.find_by(id: params[:id])
    user = User.find_by(id: params[:user])
    spot.user = user
    user.spots << spot
    redirect "/spots/#{spot.id}"
  end

  # # DELETE: /spots/5/delete
  # delete "/spots/:id/delete" do
  #   redirect "/spots"
  # end

end
