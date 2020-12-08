require 'swagger_helper'
describe 'api/v1/sessions_controller_controller' do
  path '/api/v1/auth/sign_in' do
    post 'User SignIn' do
      tags 'User'
      consumes 'application/json', 'application/xml'
      parameter name: :email, in: :formData, schema: {
        type: :string,
        properties: {
          title: { email: :string },
          content: { password: :string }
        },
        required: [ 'email', 'password' ]
      }

      response '201', 'email created' do
        let(:email) { { email: 'foo', password: 'bar' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:email) { { email: 'foo' } }
        run_test!
      end
    end
  end
end