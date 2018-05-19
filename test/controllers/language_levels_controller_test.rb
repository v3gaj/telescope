require 'test_helper'

class LanguageLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @language_level = language_levels(:one)
  end

  test "should get index" do
    get language_levels_url
    assert_response :success
  end

  test "should get new" do
    get new_language_level_url
    assert_response :success
  end

  test "should create language_level" do
    assert_difference('LanguageLevel.count') do
      post language_levels_url, params: { language_level: { not_available: @language_level.not_available, title: @language_level.title } }
    end

    assert_redirected_to language_level_url(LanguageLevel.last)
  end

  test "should show language_level" do
    get language_level_url(@language_level)
    assert_response :success
  end

  test "should get edit" do
    get edit_language_level_url(@language_level)
    assert_response :success
  end

  test "should update language_level" do
    patch language_level_url(@language_level), params: { language_level: { not_available: @language_level.not_available, title: @language_level.title } }
    assert_redirected_to language_level_url(@language_level)
  end

  test "should destroy language_level" do
    assert_difference('LanguageLevel.count', -1) do
      delete language_level_url(@language_level)
    end

    assert_redirected_to language_levels_url
  end
end
