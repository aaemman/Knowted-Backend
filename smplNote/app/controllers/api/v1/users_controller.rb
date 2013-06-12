module Api
	module V1
		class UsersController < ApplicationController

			respond_to :json


			def show
				respond_with User.find(params[:id])
			end

			def create
				respond_with User.create(params[:user])
			end
		end
	end
end