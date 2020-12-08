require 'swagger_helper'
RSpec.describe "api/v1/orders_controller", type: :request do
  path '/api/v1/orders' do
    get 'Get all Users' do
      tags 'Users'
      produces 'application/json', 'application/xml'
       parameter user_id: :id, in: :path, type: :string
      response '200', 'blog found' do
        schema type: :object,
          properties: {
          #user_id:  { type: :integer }, created_at: { type: :integer }, updated_at:  { type: :integer }, express_token:  { type: :integer }, express_payer_id:  { type: :integer }, first_name:  { type: :integer }, last_name:  { type: :integer },
            id: { type: :integer },
          email: { type: :string },

           
          },
          required: [ 'id', 'email' ]
        let(:id) { Blog.create(email: 'foo').id }
        run_test!
      end

      response '404', 'blog not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end
end

#require 'swagger_helper'
#RSpec.describe "api/v1/orders_controller", type: :request do

#    path '/api/v1/orders' do

#     get 'Get all orders' do
#       tags 'Orders'
#       produces 'application/json', 'application/xml'
#       # parameter user_id: :id, in: :path, type: :string


#       response '200', 'blog found' do
#         schema type: :object,
#           properties: {
#             user_id:  { type: :integer }, created_at:  { type: :integer }, updated_at:  { type: :integer }, express_token:  { type: :integer }, express_payer_id:  { type: :integer }, first_name:  { type: :integer }, last_name:  { type: :integer }
#           }
#         run_test!
#       end

#       response '404', 'Order not found' do
#         let(:id) { 'invalid' }
#         run_test!
#       end

#       response '406', 'unsupported accept header' do
#         let(:'Accept') { 'application/foo' }
#         run_test!
#       end
#     end
# end

# end
