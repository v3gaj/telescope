require "application_system_test_case"

class JobsTest < ApplicationSystemTestCase
  setup do
    @job = jobs(:one)
  end

  test "visiting the index" do
    visit jobs_url
    assert_selector "h1", text: "Jobs"
  end

  test "creating a Job" do
    visit jobs_url
    click_on "New Job"

    fill_in "Employment", with: @job.employment_id
    fill_in "Industry", with: @job.industry_id
    fill_in "Job Description", with: @job.job_description
    fill_in "Job Title", with: @job.job_title
    fill_in "Language", with: @job.language_id
    fill_in "Other Signs", with: @job.other_signs
    fill_in "Preferred", with: @job.preferred
    fill_in "Province", with: @job.province
    fill_in "Requirements", with: @job.requirements
    fill_in "Schedule", with: @job.schedule_id
    click_on "Create Job"

    assert_text "Job was successfully created"
    click_on "Back"
  end

  test "updating a Job" do
    visit jobs_url
    click_on "Edit", match: :first

    fill_in "Employment", with: @job.employment_id
    fill_in "Industry", with: @job.industry_id
    fill_in "Job Description", with: @job.job_description
    fill_in "Job Title", with: @job.job_title
    fill_in "Language", with: @job.language_id
    fill_in "Other Signs", with: @job.other_signs
    fill_in "Preferred", with: @job.preferred
    fill_in "Province", with: @job.province
    fill_in "Requirements", with: @job.requirements
    fill_in "Schedule", with: @job.schedule_id
    click_on "Update Job"

    assert_text "Job was successfully updated"
    click_on "Back"
  end

  test "destroying a Job" do
    visit jobs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job was successfully destroyed"
  end
end
