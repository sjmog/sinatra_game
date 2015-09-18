require 'sinatra'
require './lib/game'
require './lib/player'
enable :sessions

# STAGE 1: sign up

get '/' do
  erb :index
end

post '/sign-up' do
  session[:user] = params[:username]
  redirect '/account'
end

get '/account' do
  @user = session[:user]
  erb :account
end

# STAGE 2: ask the logic

post '/new-game' do
  $game = Game.new
  $game.players << Player.new(session[:user])
  redirect '/board'
end

get '/board' do
  @game = $game
  erb :board
end