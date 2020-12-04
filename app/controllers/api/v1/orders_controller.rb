class Api::V1::OrdersController < Api::V1::ApiController

	def index
		users = User.all, {status: "ok", message: "hello world"}

		render json: { users: users},status: 200
	end
end





 