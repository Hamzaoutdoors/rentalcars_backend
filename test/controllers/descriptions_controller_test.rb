require 'test_helper'

class DescriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @description = descriptions(:one)
  end

  test 'should get index' do
    get descriptions_url, as: :json
    assert_response :success
  end

  test 'should create description' do
    assert_difference('Description.count') do
      post descriptions_url,
           params: {
             description: {
               insurance_fee:
                 @description.insurance_fee,
               price_daily: @description.price_daily,
               price_monthly: @description.price_monthly
             }
           }, as: :json
    end

    assert_response 201
  end

  test 'should show description' do
    get description_url(@description), as: :json
    assert_response :success
  end

  test 'should update description' do
    patch description_url(@description),
          params: {
            description: {
              insurance_fee:
              @description.insurance_fee,
              price_daily: @description.price_daily,
              price_monthly: @description.price_monthly
            }
          }, as: :json
    assert_response 200
  end

  test 'should destroy description' do
    assert_difference('Description.count', -1) do
      delete description_url(@description), as: :json
    end

    assert_response 204
  end
end
