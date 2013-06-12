module Api
	module V1
		class NotesController < ApplicationController
			respond_to :json

			def index
				user = User.find_by_auth_token(params[:auth_token])

				if user						
					respond_with user.notes
				else
					respond_with nil
				end
			end

			def show
				user = User.find_by_auth_token(params[:auth_token])

				if user						
					respond_with Note.find(params[:id])
				else
					respond_with nil
				end
			end

			def create
				user = User.find_by_auth_token(params[:auth_token])

				if user		
					note = user.create_note!(params[:note][:text])				
					respond_with note
				else
					respond_with nil
				end
			end
		end
	end
end