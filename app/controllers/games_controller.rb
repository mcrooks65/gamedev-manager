class GamesController < ApplicationController
  get '/games' do # Index all games.
    @games = Game.all
    erb :'/games/index'
  end

  get '/games/:slug' do # Game Show page using slugs
    @current_game = Game.find_by_slug(params[:slug])
    if @current_game
      @current_game_dev = Developer.find { |dev| dev.id == @current_game.developer_id }
      erb :'games/show'
    end
  end

  get '/newgame' do # Create Game page
    if logged_in?
      erb :'/games/create'
    else
      redirect '/login'
    end
  end

  post '/newgame' do # Create Game action
    @current_dev = Developer.find_by(id: session[:user_id])
    if params[:title] == "" || params[:description] == "" || params[:genre] == "" || params[:price] == "" # User Input Validation - Blank field check
      redirect '/newgame'
    elsif params[:title].to_i > 0 || params[:description].to_i > 0 || params[:genre].to_i > 0 || params[:price].to_i < 1 # User Input Validation - Correct data type
      erb :'/error2'
    elsif Game.find_by(:title => params[:title]) != nil # Validates if game is already in db
      erb :'/error4'
    else
      @game = Game.new(:title => params[:title], :developer_id => @current_dev.id, :description => params[:description], :genre => params[:genre], :price => params[:price])
      @game.save
      redirect "/games/#{@game.slug}"
    end
  end

  get '/games/:slug/edit' do # Edit Game page
    @current_game = Game.find_by_slug(params[:slug])
    @current_dev = Developer.find_by(id: session[:user_id])
    if logged_in? && @current_game.developer_id == @current_dev.id
      erb :'/games/edit'
    else
      redirect '/login'
    end
  end

  patch '/games/:slug' do # Edit Game action
    if params[:title] == "" || params[:description] == "" || params[:genre] == "" || params[:price] == ""
      redirect '/games/:slug/edit'
    elsif params[:title].to_i > 0 || params[:description].to_i > 0 || params[:genre].to_i > 0 || params[:price].to_i < 1
      erb :'/error2'
    else
      @current_game = Game.find_by_slug(params[:slug])
      @current_game.title = params[:title]
      @current_game.description = params[:description]
      @current_game.genre = params[:genre]
      @current_game.price = params[:price]
      @current_game.save
      redirect to "/games/#{@current_game.slug}"
    end
  end

  delete '/games/:slug/delete' do # Delete Game action
    @current_game = Game.find_by_slug(params[:slug])
    @current_dev = Developer.find_by(id: session[:user_id])
    if logged_in? && @current_game.developer_id == @current_dev.id
      if @current_game
        @current_game.delete
      end
      redirect to '/games'
    else
      redirect to '/login'
    end
  end
end
