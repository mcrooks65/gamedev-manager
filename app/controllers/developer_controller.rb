class DeveloperController < ApplicationController

  get '/register' do
    erb :'/devs/register'
  end

  post '/register' do
    if params[:name] == "" || params[:password] == ""
      redirect to '/register'
    else
      @developer = Developer.new(:name => params[:name], :password => params[:password], :employees => params[:employees], :location => params[:location])
      @developer.save
      session[:user_id] = @developer.id
      redirect to '/login'
    end
  end

  get '/login' do # Login page.
    erb :'/devs/login'
  end

  post '/login' do
    @user = Developer.find_by(:name => params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/test"
    else
      redirect to '/login'
    end
  end

  get '/test' do
    @current_dev = Developer.find_by_id(session[:user_id])
    @current_dev_games = Game.select { |game| game.developer_id == @current_dev.id}
    if @current_dev
      erb :test
    else
      erb :error
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

  get '/devs' do # Index all developers.
    @devs = Developer.all
    erb :'/devs/show'
  end
end
