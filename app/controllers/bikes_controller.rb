class BikesController < ApplicationController

  # GET: /bikes
  get "/bikes" do
    erb :"/bikes/index.html"
  end

  # GET: /bikes/new
  get "/bikes/new" do
    erb :"/bikes/new.html"
  end

  # POST: /bikes
  post "/bikes" do
    redirect "/bikes"
  end

  # GET: /bikes/5
  get "/bikes/:id" do
    erb :"/bikes/show.html"
  end

  # GET: /bikes/5/edit
  get "/bikes/:id/edit" do
    erb :"/bikes/edit.html"
  end

  # PATCH: /bikes/5
  patch "/bikes/:id" do
    redirect "/bikes/:id"
  end

  # DELETE: /bikes/5/delete
  delete "/bikes/:id/delete" do
    redirect "/bikes"
  end
end
