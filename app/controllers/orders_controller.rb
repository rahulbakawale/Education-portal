class OrdersController < ApplicationController
	def express
  response = EXPRESS_GATEWAY.setup_purchase(30,
    :ip                => request.remote_ip,
    :return_url        => new_order_url,
    :cancel_return_url => 'http://google.com'
  )
  redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
end

def new
  @order = Order.new(:express_token => params[:token])
end
end
