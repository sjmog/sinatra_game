require 'sinatra'

enable :sessions

# GET /1
get '/1' do
  erb :index
end

# GET /2
get '/2' do
  @random_number = RNG.generate
  erb :random_number
end

# GET /3?name=<name>
get '/3' do
  @name = params["name"]
  erb :name
end

# GET /4?name=<name>
get '/4' do
  session["name"] = params["name"]
  @name = session["name"]
  erb :name
end

# GET /5
get '/5' do
  @name = session["name"]
  erb :name
end