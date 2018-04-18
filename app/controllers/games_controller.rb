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
    else
      erb :error2 #might want a new error message for game not found..
    end
  end
end
