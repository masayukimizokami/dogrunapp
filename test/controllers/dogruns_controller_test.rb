require "test_helper"

class DogrunsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dogrun = dogruns(:one)
  end

  test "should get index" do
    get dogruns_url
    assert_response :success
  end

  test "should get new" do
    get new_dogrun_url
    assert_response :success
  end

  test "should create dogrun" do
    assert_difference('Dogrun.count') do
      post dogruns_url, params: { dogrun: { address: @dogrun.address, dogrun_name: @dogrun.dogrun_name, image: @dogrun.image, pr: @dogrun.pr, user_id: @dogrun.user_id } }
    end

    assert_redirected_to dogrun_url(Dogrun.last)
  end

  test "should show dogrun" do
    get dogrun_url(@dogrun)
    assert_response :success
  end

  test "should get edit" do
    get edit_dogrun_url(@dogrun)
    assert_response :success
  end

  test "should update dogrun" do
    patch dogrun_url(@dogrun), params: { dogrun: { address: @dogrun.address, dogrun_name: @dogrun.dogrun_name, image: @dogrun.image, pr: @dogrun.pr, user_id: @dogrun.user_id } }
    assert_redirected_to dogrun_url(@dogrun)
  end

  test "should destroy dogrun" do
    assert_difference('Dogrun.count', -1) do
      delete dogrun_url(@dogrun)
    end

    assert_redirected_to dogruns_url
  end
end
