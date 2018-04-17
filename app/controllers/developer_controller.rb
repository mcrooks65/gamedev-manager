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
    @user = Developer.find_by(:name => params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/test"
    else
      redirect to '/login'
    end
  end

  get '/test' do
    @current_user = Developer.find_by_id(session[:user_id])
    if @current_user
      erb :test
      binding.pry
    else
      erb :error
    end
  end

  get '/devs' do # Index all developers.
    @devs = Developer.all
    erb :'/devs/show'
  end
end
