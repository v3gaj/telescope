class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :selects_form, only: [:new, :edit,:create, :update]
  before_action :require_user, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]

  # GET /jobs
  # GET /jobs.json
  def index
    if current_user && current_user.admin?
      @jobs = Job.all
    else
      @jobs = Job.all.where(status: "open")
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    if @job.status != "Open" && current_user && !current_user.admin?
      redirect_back fallback_location: jobs_path, alert: 'You cannot access this information.'
    end
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    @job.status = 'Open'
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:job_title, :job_description, :language_id, :industry_id, :employment_id, :schedule_id, :province, :other_signs, :status, :hire_date)
    end

    def selects_form
      @languajes = Language.all.where(:not_available == false)
      @employments = Employment.all.where(:not_available == false)
      @industries = Industry.all.where(:not_available == false)
      @schedules = Schedule.all.where(:not_available == false)
    end
end
