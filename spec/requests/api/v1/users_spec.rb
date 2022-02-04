require 'swagger_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe 'api/v1/users', type: :request do
  let(:user) { create(:user) }
  let(:user1) { create(:user, username: 'Qwerty') }
  let(:Authorization) { "Bearer #{JWT.encode({ user_id: user[:id] }, 'HaNJLisLook1ng')}" }
  path '/signup' do
    post('create user') do
      consumes 'application/json'
      produces 'application/json'
      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              username: { type: :string },
              email: { type: :string },
              password: { type: :string }
            },
            required: %w[username email password]
          }
        },
        required: ['user']
      }

      response(201, 'successful') do
        let(:data) do
          {
            user: { username: 'FakeUser', email: 'fake@email.com', password: 'password' }
          }
        end
        run_test!
      end
    end
  end

  path '/login' do
    post('login user') do
      consumes 'application/json'
      produces 'application/json'
      security [bearer_auth: []]
      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              username: { type: :string },
              email: { type: :string },
              password: { type: :string }
            },
            required: %w[email password]
          }
        },
        required: ['user']
      }

      response(201, 'successful') do
        let(:data) do
          {
            user: { username: 'Bugos', email: 'Begos@bogos.com', password: 'Bigos' }
          }
        end
        run_test!
      end

      response(401, 'unauthorized') do
        let(:data) do
          {
            user: { username: 'FakeUser', email: 'fake@email.com', password: 'password' }
          }
        end
        run_test!
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
