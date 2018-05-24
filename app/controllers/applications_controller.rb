class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:create, :destroy]
  before_action :require_user
  before_action :require_admin, only: [:index, :edit, :new, :update]
  before_action :require_same_user, only: [:create, :destroy]
  before_action :admin_not_allowed, only: [:create]

  # GET /applications
  # GET /applications.json
  def index
    @applications = Application.all
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
  end

  # GET /applications/new
  def new
    @application = Application.new
  end

  # GET /applications/1/edit
  def edit
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(application_params)
    @application.status = 'Created'
    respond_to do |format|
      if Application.user_already_applied(@application.job_id, @user)
        format.js { flash.now[:danger] = t("applications.create.already_applied") }
      else
        if @application.save
          format.html { redirect_to applications_url, notice: 'Application was successfully created.' }
          format.json { render :show, status: :created, location: @application }
          format.js   { flash.now[:notice] = t("applications.create.successfully_applied") }
        else
          format.html { render :new }
          format.json { render json: @application.errors, status: :unprocessable_entity }
          format.js   { render :layout => false }
        end
      end
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to applications_url, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    @jobs = @user.jobs.all.joins(:applications).where(created_at: 6.months.ago..Time.now).order('applications.created_at DESC')
    respond_to do |format|
      format.html { redirect_to applications_url, notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    def set_user
      @user = User.find(params[:application][:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:user_id, :job_id, :status)
    end
end
