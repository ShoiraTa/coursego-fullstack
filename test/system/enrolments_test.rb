require "application_system_test_case"

class EnrolmentsTest < ApplicationSystemTestCase
  setup do
    @enrolment = enrolments(:one)
  end

  test "visiting the index" do
    visit enrolments_url
    assert_selector "h1", text: "Enrolments"
  end

  test "should create enrolment" do
    visit enrolments_url
    click_on "New enrolment"

    fill_in "Course", with: @enrolment.course_id
    fill_in "Price", with: @enrolment.price
    fill_in "Rating", with: @enrolment.rating
    fill_in "Review", with: @enrolment.review
    fill_in "User", with: @enrolment.user_id
    click_on "Create Enrolment"

    assert_text "Enrolment was successfully created"
    click_on "Back"
  end

  test "should update Enrolment" do
    visit enrolment_url(@enrolment)
    click_on "Edit this enrolment", match: :first

    fill_in "Course", with: @enrolment.course_id
    fill_in "Price", with: @enrolment.price
    fill_in "Rating", with: @enrolment.rating
    fill_in "Review", with: @enrolment.review
    fill_in "User", with: @enrolment.user_id
    click_on "Update Enrolment"

    assert_text "Enrolment was successfully updated"
    click_on "Back"
  end

  test "should destroy Enrolment" do
    visit enrolment_url(@enrolment)
    click_on "Destroy this enrolment", match: :first

    assert_text "Enrolment was successfully destroyed"
  end
end
