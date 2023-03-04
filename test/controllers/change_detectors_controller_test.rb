require "test_helper"

class ChangeDetectorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @change_detector = change_detectors(:one)
  end

  test "should get index" do
    get change_detectors_url
    assert_response :success
  end

  test "should get new" do
    get new_change_detector_url
    assert_response :success
  end

  test "should create change_detector" do
    assert_difference("ChangeDetector.count") do
      post change_detectors_url, params: { change_detector: { url: @change_detector.url } }
    end

    assert_redirected_to change_detector_url(ChangeDetector.last)
  end

  test "should show change_detector" do
    get change_detector_url(@change_detector)
    assert_response :success
  end

  test "should get edit" do
    get edit_change_detector_url(@change_detector)
    assert_response :success
  end

  test "should update change_detector" do
    patch change_detector_url(@change_detector), params: { change_detector: { url: @change_detector.url } }
    assert_redirected_to change_detector_url(@change_detector)
  end

  test "should destroy change_detector" do
    assert_difference("ChangeDetector.count", -1) do
      delete change_detector_url(@change_detector)
    end

    assert_redirected_to change_detectors_url
  end
end
