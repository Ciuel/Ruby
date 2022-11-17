require "test_helper"

class OfficeHoursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @office_hour = office_hours(:one)
  end

  test "should get index" do
    get office_hours_url
    assert_response :success
  end

  test "should get new" do
    get new_office_hour_url
    assert_response :success
  end

  test "should create office_hour" do
    assert_difference("OfficeHour.count") do
      post office_hours_url, params: { office_hour: { branch_id: @office_hour.branch_id, day: @office_hour.day, end: @office_hour.end, start: @office_hour.start } }
    end

    assert_redirected_to office_hour_url(OfficeHour.last)
  end

  test "should show office_hour" do
    get office_hour_url(@office_hour)
    assert_response :success
  end

  test "should get edit" do
    get edit_office_hour_url(@office_hour)
    assert_response :success
  end

  test "should update office_hour" do
    patch office_hour_url(@office_hour), params: { office_hour: { branch_id: @office_hour.branch_id, day: @office_hour.day, end: @office_hour.end, start: @office_hour.start } }
    assert_redirected_to office_hour_url(@office_hour)
  end

  test "should destroy office_hour" do
    assert_difference("OfficeHour.count", -1) do
      delete office_hour_url(@office_hour)
    end

    assert_redirected_to office_hours_url
  end
end
