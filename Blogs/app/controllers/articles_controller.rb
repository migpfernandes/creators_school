class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find params[:id]
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.create article_params
		if @article.save
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
		@article = Article.find params[:id]
	end

	def destroy
		@article = Article.find params[:id]
		Article.delete @article
		redirect_to root_path
	end

	def update
		@article = Article.find params[:id]
		if @article.update(article_params)
    	redirect_to(@article)
  	else
    	render "edit"
  	end
	end


	private
	def article_params
		params.require(:article).permit(:title,:description)
	end

end