require "application_system_test_case"

class ChangeDetectorsTest < ApplicationSystemTestCase
  setup do
    @change_detector = change_detectors(:one)
  end

  test "visiting the index" do
    visit change_detectors_url
    assert_selector "h1", text: "Change detectors"
  end

  test "should create change detector" do
    visit change_detectors_url
    click_on "New change detector"

    fill_in "Url", with: @change_detector.url
    click_on "Create Change detector"

    assert_text "Change detector was successfully created"
    click_on "Back"
  end

  test "should update Change detector" do
    visit change_detector_url(@change_detector)
    click_on "Edit this change detector", match: :first

    fill_in "Url", with: @change_detector.url
    click_on "Update Change detector"

    assert_text "Change detector was successfully updated"
    click_on "Back"
  end

  test "should destroy Change detector" do
    visit change_detector_url(@change_detector)
    click_on "Destroy this change detector", match: :first

    assert_text "Change detector was successfully destroyed"
  end
end
