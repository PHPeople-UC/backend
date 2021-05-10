require 'swagger_helper'

describe 'User endpoints', swagger_doc: 'v1/swagger.json' do
  path '/users' do
    post 'Sign up' do
      description 'Sign up a new user'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :registration_params, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string, example: "jero@example.com" },
              name: { type: :string, example: "jero" },
              last_name: { type: :string, example: "salazar" },
              password: { type: :string, example: "123456" },
              password_confirmation: { type: :string, example: "123456" }
            }
          }
        },
        required: ['email', 'name', 'last_name', 'password', 'password_confirmation']
      }

      response '201', 'user created' do
        run_test!
      end
    end
  end

  path '/users/login' do
    post 'User login' do
      description 'Login user. This method returns the user info + a JWT for authentication'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :session_params, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string, example: "jero@example.com" },
          password: { type: :string, example: "123456" }
        }
      }

      response '201', 'logged in' do
        run_test!
      end
    end
  end
end
