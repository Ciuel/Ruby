require "application_system_test_case"

class OfficeHoursTest < ApplicationSystemTestCase
  setup do
    @office_hour = office_hours(:one)
  end

  test "visiting the index" do
    visit office_hours_url
    assert_selector "h1", text: "Office hours"
  end

  test "should create office hour" do
    visit office_hours_url
    click_on "New office hour"

    fill_in "Branch", with: @office_hour.branch_id
    fill_in "Day", with: @office_hour.day
    fill_in "End", with: @office_hour.end
    fill_in "Start", with: @office_hour.start
    click_on "Create Office hour"

    assert_text "Office hour was successfully created"
    click_on "Back"
  end

  test "should update Office hour" do
    visit office_hour_url(@office_hour)
    click_on "Edit this office hour", match: :first

    fill_in "Branch", with: @office_hour.branch_id
    fill_in "Day", with: @office_hour.day
    fill_in "End", with: @office_hour.end
    fill_in "Start", with: @office_hour.start
    click_on "Update Office hour"

    assert_text "Office hour was successfully updated"
    click_on "Back"
  end

  test "should destroy Office hour" do
    visit office_hour_url(@office_hour)
    click_on "Destroy this office hour", match: :first

    assert_text "Office hour was successfully destroyed"
  end
end
