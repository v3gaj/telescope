require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job = jobs(:one)
  end

  test "should get index" do
    get jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_job_url
    assert_response :success
  end

  test "should create job" do
    assert_difference('Job.count') do
      post jobs_url, params: { job: { employment_id: @job.employment_id, industry_id: @job.industry_id, job_description: @job.job_description, job_title: @job.job_title, language_id: @job.language_id, other_signs: @job.other_signs, preferred: @job.preferred, province: @job.province, requirements: @job.requirements, schedule_id: @job.schedule_id } }
    end

    assert_redirected_to job_url(Job.last)
  end

  test "should show job" do
    get job_url(@job)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_url(@job)
    assert_response :success
  end

  test "should update job" do
    patch job_url(@job), params: { job: { employment_id: @job.employment_id, industry_id: @job.industry_id, job_description: @job.job_description, job_title: @job.job_title, language_id: @job.language_id, other_signs: @job.other_signs, preferred: @job.preferred, province: @job.province, requirements: @job.requirements, schedule_id: @job.schedule_id } }
    assert_redirected_to job_url(@job)
  end

  test "should destroy job" do
    assert_difference('Job.count', -1) do
      delete job_url(@job)
    end

    assert_redirected_to jobs_url
  end
end
