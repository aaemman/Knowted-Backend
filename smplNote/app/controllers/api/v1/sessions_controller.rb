module Api
	module V1
		class SessionsController < ApplicationController
			
			respond_to :json

			def create
				user = User.find_by_email(params[:user][:email])

				if user && user.authenticate(params[:password])
					generate_auth_token(user)
					respond_with user.auth_token

				else 
					user = User.find_by_auth_token(params[:auth_token])

					if user
						
							respond_with user.auth_token
					end

				end	

			end

			private

			def generate_auth_token(user)
				begin
					user.auth_token = SecureRandom.hex
				end while user.class.exists?(auth_token: auth_token)

			end
		end

		
	end
end