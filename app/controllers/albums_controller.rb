class AlbumsController < ApplicationController

	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

	def create
		@album = current_user.albums.build(album_params)
		if @album.save
			flash[:success] = "Album Created"
			redirect_to root_url
		else
			@feed_items = []
			render 'staticpages/home'
		end
	end

	def destroy
		@album.destroy
		redirect_to root_url
	end

	def index
	end

	private

	def album_params
		params.require(:album).permit(:name, :description)
	end

	def correct_user
		@album = current_user.albums.find_by(id: params[:id])
		redirect_to root_url if @album.nil?
	end

end
