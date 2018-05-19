require "application_system_test_case"

class LanguageLevelsTest < ApplicationSystemTestCase
  setup do
    @language_level = language_levels(:one)
  end

  test "visiting the index" do
    visit language_levels_url
    assert_selector "h1", text: "Language Levels"
  end

  test "creating a Language level" do
    visit language_levels_url
    click_on "New Language Level"

    fill_in "Not Available", with: @language_level.not_available
    fill_in "Title", with: @language_level.title
    click_on "Create Language level"

    assert_text "Language level was successfully created"
    click_on "Back"
  end

  test "updating a Language level" do
    visit language_levels_url
    click_on "Edit", match: :first

    fill_in "Not Available", with: @language_level.not_available
    fill_in "Title", with: @language_level.title
    click_on "Update Language level"

    assert_text "Language level was successfully updated"
    click_on "Back"
  end

  test "destroying a Language level" do
    visit language_levels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Language level was successfully destroyed"
  end
end
