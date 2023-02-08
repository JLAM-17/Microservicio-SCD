require "test_helper"

class Api::V1::PreguntasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_preguntas_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_preguntas_show_url
    assert_response :success
  end
end
