require 'swagger_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe 'api/v1/cars', type: :request do
  let(:user) { create(:user) }
  let(:Authorization) { "Bearer #{JWT.encode({ user_id: user[:id] }, 'HaNJLisLook1ng')}" }
  let(:car) { create(:car, user_id: user[:id]) }
  let(:car1) { create(:car, name: 'boo', user_id: user[:id]) }

  path '/api/v1/cars' do
    get('list cars') do
      consumes 'application/json'
      produces 'application/json'
      response(200, 'successful') do
        run_test!
      end
    end

    post('create car') do
      consumes 'application/json'
      produces 'application/json'
      security [bearer_auth: []]
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          car: {
            type: :object,
            properties: {
              name: { type: :string },
              brand: { type: :string },
              imgUrl: { type: :string },
              user_id: { type: :string }
            },
            required: %w[name brand imgUrl user_id]
          },
          description: {
            type: :object,
            properties: {
              price_daily: { type: :string },
              price_monthly: { type: :string },
              color: { type: :string }
            },
            required: %w[price_daily price_monthly color]
          }
        },
        required: %w[car description]
      }

      response(201, 'successful') do
        let(:data) do
          {
            car: { name: 'smth', brand: 'smth', imgUrl: 'smth', user_id: user[:id] },
            description: { price_daily: '10', price_monthly: '300', color: '#000' }
          }
        end
        run_test!
      end

      response(401, 'unauthorized') do
        let(:Authorization) { 'blablubasdjasdsa ' }
        let(:data) do
          {
            car: { name: 'smth', brand: 'smth', imgUrl: 'smth', user_id: user[:id] },
            description: { price_daily: '10', price_monthly: '300', color: '#000' }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/cars/{id}' do
    get('show car') do
      consumes 'application/json'
      security [bearer_auth: []]
      parameter name: :Authorization, in: :header, type: :string
      parameter name: 'id', in: :path, type: :string, description: 'id'
      response(200, 'successful') do
        let(:id) { car[:id] }

        run_test!
      end
    end

    delete('delete car') do
      consumes 'application/json'
      security [bearer_auth: []]
      parameter name: :Authorization, in: :header, type: :string
      parameter name: 'id', in: :path, type: :string, description: 'id'
      response(200, 'successful') do
        let(:id) { car[:id] }
        run_test!
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
