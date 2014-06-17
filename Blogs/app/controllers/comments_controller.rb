class CommentsController < ApplicationController

	def index
		@comments = Comment.all
	end

	def show
		@comment = Comment.find params[:id]
	end

	def new
		@comment = Comment.new 
	end

	def create
		@comment = Comment.new comment_params
		@comment.article_id = params[:article_id]
		if @comment.save
			redirect_to article_path(@comment.article)
		else
			render :new
		end
	end

	def edit
		@comment = Comment.find params[:id]
	end

	def destroy
		@comment = Comment.find params[:id]
		Comment.delete @comment
		redirect_to root_path
	end

	def update
		@comment = Comment.find params[:id]
		if @comment.update(comment_params)
    	redirect_to article_path(@comment.article)
  	else
    	render "edit"
  	end
	end


	private
	def comment_params
		params.require(:comment).permit(:autor,:description)
	end

end