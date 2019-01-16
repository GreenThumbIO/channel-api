require 'test_helper'

class TransmissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transmission = transmissions(:one)
  end

  test "should get index" do
    get transmissions_url, as: :json
    assert_response :success
  end

  test "should create transmission" do
    assert_difference('Transmission.count') do
      post transmissions_url, params: { transmission: { message: @transmission.message } }, as: :json
    end

    assert_response 201
  end

  test "should show transmission" do
    get transmission_url(@transmission), as: :json
    assert_response :success
  end

  test "should update transmission" do
    patch transmission_url(@transmission), params: { transmission: { message: @transmission.message } }, as: :json
    assert_response 200
  end

  test "should destroy transmission" do
    assert_difference('Transmission.count', -1) do
      delete transmission_url(@transmission), as: :json
    end

    assert_response 204
  end
end
