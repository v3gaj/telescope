require "application_system_test_case"

class UserLanguagesTest < ApplicationSystemTestCase
  setup do
    @user_language = user_languages(:one)
  end

  test "visiting the index" do
    visit user_languages_url
    assert_selector "h1", text: "User Languages"
  end

  test "creating a User language" do
    visit user_languages_url
    click_on "New User Language"

    fill_in "Language", with: @user_language.language_id
    fill_in "Language Level", with: @user_language.language_level_id
    fill_in "User", with: @user_language.user_id
    click_on "Create User language"

    assert_text "User language was successfully created"
    click_on "Back"
  end

  test "updating a User language" do
    visit user_languages_url
    click_on "Edit", match: :first

    fill_in "Language", with: @user_language.language_id
    fill_in "Language Level", with: @user_language.language_level_id
    fill_in "User", with: @user_language.user_id
    click_on "Update User language"

    assert_text "User language was successfully updated"
    click_on "Back"
  end

  test "destroying a User language" do
    visit user_languages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User language was successfully destroyed"
  end
end
