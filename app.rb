$LOAD_PATH.unshift(File.expand_path('.'))

require 'sinatra'
require 'sinatra/activerecord'
require './models/note'
require './models/user'


# This loads environment variables from the .env file
require 'dotenv'
Dotenv.load

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

get '/' do
  @title = 'Login | Recall'
	erb :login
end

post '/signup' do
  @user = User.create(name: params["name"], username: params["username"], password: params["pwd"])
  @user.save
  redirect '/notes'
end

post '/login' do
  @user = User.find(params["username"], params["pwd"])
  @user.save
end

get '/notes' do
	@notes = Note.all
  @title = 'All notes | Recall'
  erb :index
end

post '/notes' do  
  n = Note.new  
  n.content = params[:content]  
  n.created_at = Time.now  
  n.updated_at = Time.now  
  n.save  
  redirect '/notes'  
end

get '/:id' do
  @note = Note.find(params[:id])
  @title = 'Edit note ##{params[:id]}'
  erb :edit
end

put '/:id' do
  n = Note.find(params[:id])
  n.content = params[:content]
  n.complete = params[:complete] ? 1 : 0
  n.updated_at = Time.now
  n.save
  redirect '/notes'
end

get '/:id/delete' do
  @note = Note.find(params[:id])
  @title = 'Delete note ##{params[:id]}'
  erb :delete
end

delete '/:id' do
  n = Note.find(params[:id])
  n.destroy
  redirect '/notes'
end

get '/:id/complete' do  
  n = Note.find(params[:id])
  n.complete = n.complete ? 0 : 1  
  n.updated_at = Time.now  
  n.save  
  redirect '/notes'  
end  