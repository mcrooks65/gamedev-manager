class DeveloperController < ApplicationController

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

  post '/login' do
    @developer = Developer.find_by(:name => params[:name])
    if @developer != nil && @developer.password == params[:password]
      session[:user_id] = @developer.id
      redirect '/test'
    else
      erb :error
    end
  end

  get '/test' do
    @current_user = Developer.find_by_id(session[:user_id])
    if @current_user
      erb :test
    else
      erb :error
    end
  end

  get '/devs' do # Index all developers.
    @devs = Developer.all
    erb :'/devs/show'
  end
end
