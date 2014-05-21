class StaticpagesController < ApplicationController

	def home
		@album = current_user.albums.build if signed_in?
		@feed_items = current_user.album_feed.paginate(page: params[:page], per_page: 4).order('created_at DESC') if signed_in?
	end
	
end
