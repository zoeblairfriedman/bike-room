class SpotsController < ApplicationController

  # GET: /spots
  get "/spots" do
    erb :"/spots/index.html"
  end

  # GET: /spots/new
  get "/spots/new" do
    erb :"/spots/new.html"
  end

  # POST: /spots
  post "/spots" do
    redirect "/spots"
  end

  # GET: /spots/5
  get "/spots/:id" do
    erb :"/spots/show.html"
  end

  # GET: /spots/5/edit
  get "/spots/:id/edit" do
    erb :"/spots/edit.html"
  end

  # PATCH: /spots/5
  patch "/spots/:id" do
    redirect "/spots/:id"
  end

  # DELETE: /spots/5/delete
  delete "/spots/:id/delete" do
    redirect "/spots"
  end
end
