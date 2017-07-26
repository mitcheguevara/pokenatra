require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
## Connect to the database
require_relative 'db/connection'
# Load models
require_relative 'models/pokemon'

get '/pokemons' do
  @pokemons = Pokemon.all
  erb :"pokemons/index"
end

post '/pokemons' do
  @pokemon = Pokemon.create(params[:pokemon])
  redirect "/pokemons/#{@pokemon.id}"
end

get'/pokemons/new' do
  erb :"pokemons/new"
end

get '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/show"
end

get '/pokemons/:id/edit' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/edit"
end

put 'pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  redirect "/pokemons/#{@pokemon.id}"
end

delete '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.destroy
  redirect("/pokemons")
end
