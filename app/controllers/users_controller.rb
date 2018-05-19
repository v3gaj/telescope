class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :cancel_update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    get_relation_objects(@user)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
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
    respond_to do |format|
      format.js   { render :layout => false }
    end
  end

  def profile
    @user = current_user
    get_relation_objects(@user)
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
      params.require(:user).permit(:admin, :photo, :name, :surname, :headline, :short_description, :phone_number, :birth_date, :facebook, :google_plus, :twitter, :instagram, :pinterest, :youtube)
    end
end
