class Api::V1::OrdersController < Api::V1::ApiController

	def index
		orders = User.all, {status: "ok", message: "hello world"}

		render json: { orders: orders},status: 200
	end
end




 