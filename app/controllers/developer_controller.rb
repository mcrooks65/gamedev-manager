class DeveloperController < ApplicationController

  get '/devs' do # Index all developers.
    @devs = Developer.all
    erb :'/devs/index'
  end

  get '/register' do # Create Developer page
    erb :'/devs/register'
  end

  post '/register' do # Create Developer action
    if params[:name] == "" || params[:password] == "" || params[:employees] == "" || params[:location] == ""  # This is user input validation - Specifically checking for blank fields.
      redirect to '/register'
    elsif params[:name].to_i > 0 || params[:employees].to_i < 1 || params[:location].to_i > 0 # Addtional validation - makes sure correct data type is passed.
      erb :'/error2'
    elsif Developer.find_by(:name => params[:name]) != nil # Validate that Developer isn't already in DB
      erb :'/error3'
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
    @dev = Developer.find_by(:name => params[:name])
    if @dev && @dev.authenticate(params[:password])
      session[:user_id] = @dev.id
      redirect "/devs/#{@dev.slug}"
    else
      redirect to '/login'
    end
  end

  get '/devs/:slug' do # Developer Show page using slugs
    @current_dev = Developer.find_by_slug(params[:slug])
    @current_dev_games = Game.select { |game| game.developer_id == @current_dev.id}
    if @current_dev.id == session[:user_id] # Probably could have just used logged_in? method like in /logout
      erb :'devs/show'
    else
      erb :error
    end
  end

  get '/logout' do # Logout and clear current session
    if logged_in?
      session.destroy
    end
    redirect to '/'
  end

end
