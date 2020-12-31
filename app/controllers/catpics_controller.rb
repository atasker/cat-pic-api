class CatpicsController < ApplicationController

	before_action :set_catpic, only: [:show, :update, :destroy]

	def index
		@catpics = Catpic.all
		json_response(@catpics)
	end

	def create
		@catpic = Catpic.create!(catpic_params)
		json_response(@catpic, :created)
	end

	def show
		json_response(@catpic)
	end

	def update
		@catpic.update(catpic_params)
		head :no_content
	end

	def destroy
		@catpic.destroy
		head :no_content
	end

	private

	def catpic_params
		params.permit(:image)
	end

	def set_catpic
		@catpic = Catpic.find(params[:id])
	end

end
