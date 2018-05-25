class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :cancel_update, :admin_profile, :profile_content, :profile_applications]
  before_action :require_user
  before_action :require_admin, only: [:index, :show, :profile_maintenance]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    get_relation_objects(@user)
    @errors = User.validate_user_complete_errors(@user)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if !@user.complete
      @errors = User.validate_user_complete_errors(@user)
    end
    respond_to do |format|
      format.js   { render :layout => false }
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        @errors = User.validate_user_complete_errors(@user)
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        if !@user.complete
          @errors = User.validate_user_complete_errors(@user)
        end
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
        format.js   { render :layout => false }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js   { render :layout => false }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # CUSTOM ACTIONS

  def cancel_update
    @errors = User.validate_user_complete_errors(@user)
    respond_to do |format|
      format.js   { render :layout => false }
    end
  end

  def profile
    @user = current_user
    if !@user.admin
      get_relation_objects(@user)
      if @user.complete
        flash.now[:notice] = t('users.controller.notice')
      else
        flash.now[:danger] = t('users.controller.danger')
        @errors = User.validate_user_complete_errors(@user)
      end
    end
  end

  def profile_content
    get_relation_objects(@user)
    respond_to do |format|
      format.js   { render :layout => false }
    end
  end

  def profile_applications
    @jobs = @user.jobs.all.joins(:applications).where(created_at: 6.months.ago..Time.now).order('applications.created_at DESC')

    respond_to do |format|
      format.js   { render :layout => false }
    end
  end

  def profile_maintenance
    respond_to do |format|
      format.js   { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def get_relation_objects(user)
      @educations = Education::get_all_educations_from_user(user)
      @experiences = Experience::get_all_experiences_from_user(user)
      @skills = Skill::get_all_skills_from_user(user)
      @user_languages = UserLanguage::get_all_user_languages_from_user(user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:admin, :photo, :name, :surname, :headline, :short_description, :phone_number, :birth_date, :facebook, :google_plus, :twitter, :instagram, :pinterest, :youtube, :complete)
    end
end
