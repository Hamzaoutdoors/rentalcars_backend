require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do
  let(:user) { create(:user) }
  let(:car) { create(:car, user_id: user[:id]) }
  let(:Authorization) { "Bearer #{JWT.encode({user_id: user[:id]}, 'HaNJLisLook1ng')}" }
  let(:reservation) { create(:reservation, user_id: user[:id], car_id: car[:id])} 
  let(:reservation1) { create(:reservation, user_id: user[:id], car_id: car[:id],start_date: '2020-02-02') }

  path '/api/v1/reservations' do
    get('list reservations') do
      consumes 'application/json'
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string
      response(200, 'successful') do
        run_test!
      end
    end

    post('create reservation') do
      consumes 'application/json'
      produces 'application/json'
      security [ bearer_auth: [] ]
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          reservation: {
            type: :object,
            properties: {
              start_date: { type: :string },
              end_date: { type: :string },
              user_id: { type: :string },
              car_id: { type: :string }
            },
            required: [ 'start_date', 'end_date', 'user_id', 'car_id' ]
          }
        },
        required: ['reservation']
      }
      
      response(201, 'successful') do
        let(:data) { {
          reservation: { start_date: '2022-02-02', end_date: '2022-02-05',  user_id: user[:id], car_id: car[:id]}
          }}
        run_test!
      end

      response(401, 'unauthorized') do
        let(:Authorization) { 'blablubasdjasdsa ' }
        let(:data) { {
          reservation: { start_date: '2022-02-02', end_date: '2022-02-05',  user_id: user[:id], car_id: car[:id]}
          }}
        run_test!
      end
    end
  end

  delete('delete car') do
    consumes 'application/json'
    security [ bearer_auth: [] ]
    parameter name: :Authorization, in: :header, type: :string
    parameter name: 'id', in: :path, type: :string
    response(200, 'successful') do
      let(:id) { reservation[:id] }
      run_test!
    end
  end
end
