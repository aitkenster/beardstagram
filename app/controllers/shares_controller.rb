class SharesController < ApplicationController

	def index
		@shares = Share.all
	end

	def new
		@share = Share.new
		if !user_signed_in?
			flash[:notice] = "Please sign up to Beardstagram to share pictures"
			redirect_to '/shares'
		end
	end

	def create
		@share = Share.new(params[:share].permit(:title, :picture, :address, :clip_list, :price))
		@share.user = current_user
		@share.save
		redirect_to '/shares'
			Pusher['beardstagram'].trigger('photo_added', {
      message: 'A new photo has been added. Refresh the page to see it.'
    })

	end

end
