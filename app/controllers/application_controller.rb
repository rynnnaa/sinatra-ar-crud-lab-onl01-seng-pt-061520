
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    @articles = Articles.all
    erb :index
  end
  
  get '/articles/new' do
    erb :new
  end
    
  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect to('/articles/#{@article.id}')
    erb :show
  end
  
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
  
  get '/articles/:id/edit' do
    @article_edit = Article.find_by_id(params[:id])
    erb :edit
  end
  
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to('/articles/#{@articcle.id}')
  end
  
  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to('articles')
  end
    
end
