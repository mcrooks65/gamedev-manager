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
    @game = Game.new(:title => params[:title], :developer_id => @current_dev.id, :description => params[:description], :genre => params[:genre], :price => params[:price])
    @game.save
    redirect "/games/#{@game.slug}"
  end

  get '/games/:slug/edit' do
    erb :'/games/edit'
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
