class GamesController < ApplicationController
  get '/games' do # Index all games.
    @games = Game.all
    erb :'/games/show'
  end
end
