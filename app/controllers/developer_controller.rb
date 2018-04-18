class DeveloperController < ApplicationController

  get '/devs' do # Index all developers.
    @devs = Developer.all
    erb :'/devs/show'
  end

  get '/register' do # Create Developer page
    erb :'/devs/register'
  end

  post '/register' do # Create Developer action
    if params[:name] == "" || params[:password] == ""
      redirect to '/register'
    else
      @developer = Developer.new(:name => params[:name], :password => params[:password], :employees => params[:employees], :location => params[:location])
      @developer.save
      session[:user_id] = @developer.id
      redirect to '/login'
    end
  end

  get '/login' do # Login page for Developers.
    erb :'/devs/login'
  end

  post '/login' do # Login action for Developers
    @user = Developer.find_by(:name => params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/devs/#{@user.slug}"
    else
      redirect to '/login'
    end
  end

  get '/devs/:slug' do # Developer Show page using slugs
    @current_dev = Developer.find_by_slug(params[:slug])
    @current_dev_games = Game.select { |game| game.developer_id == @current_dev.id}
    if @current_dev.id == session[:user_id]
      erb :'devs/show'
    else
      erb :error
    end
  end

  get '/logout' do # Logout
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end


end
