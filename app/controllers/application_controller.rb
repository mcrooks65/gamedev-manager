require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "gamerskeepgaming"
  end

  get '/' do
    erb :index
  end

  get '/register' do
    erb :'/devs/register'
  end

  post '/register' do
    if params[:name] == "" || params[:password] == ""
      redirect to '/register'
    else
      @developer = Developer.new(:name => params[:name], :password => params[:password])
      @developer.save
      session[:user_id] = @developer.id
      redirect to '/login'
    end
  end

  get '/login' do # Login page.
    erb :'/devs/login'
  end

  get '/devs/show' do # Index all developers.
    erb :'/devs/show'
  end

  get '/games/show' do # Index all games.
    erb :'/games/show'
  end

end
