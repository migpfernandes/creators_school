class CatsController < ApplicationController

	def index
		@cats = Cat.all
	end

	def show
		@cat = Cat.find params[:id]
	end

	def new
		@cat = Cat.new
	end

	def create
		@cat = Cat.create cat_params
		if @cat.save
			redirect_to.root_path
		else
			render :new
		end
	end


	private
	def cat_params
		params.require(:cat).permit(:name,:no_legs)
	end
end