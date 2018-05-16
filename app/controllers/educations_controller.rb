class EducationsController < ApplicationController
  before_action :set_education, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:edit, :new, :create, :update, :destroy, :cancel]
  before_action :set_education_all, only: [:edit, :new, :create, :update, :destroy, :cancel]
  before_action :selects_form, only: [:new, :edit, :create, :update]

  # GET /educations
  # GET /educations.json
  def index
    @educations = Education.all
  end

  # GET /educations/1
  # GET /educations/1.json
  def show
  end

  # GET /educations/new
  def new
    @education = Education.new
    respond_to do |format|
      format.js   { render :layout => false }
    end
  end

  # GET /educations/1/edit
  def edit
    respond_to do |format|
      format.js   { render :layout => false }
    end
  end

  # POST /educations
  # POST /educations.json
  def create
    @education = Education.new(education_params)
    @education.user_id = @user.id
    respond_to do |format|
      if @education.save
        format.html { redirect_to @education, notice: 'Education was successfully created.' }
        format.json { render :show, status: :created, location: @education }
        format.js   { render :layout => false }
      else
        format.html { render :new }
        format.json { render json: @education.errors, status: :unprocessable_entity }
        format.js   { render :layout => false }
      end
    end
  end

  # PATCH/PUT /educations/1
  # PATCH/PUT /educations/1.json
  def update
    respond_to do |format|
      if @education.update(education_params)
        format.html { redirect_to @education, notice: 'Education was successfully updated.' }
        format.json { render :show, status: :ok, location: @education }
        format.js   { render :layout => false }
      else
        format.html { render :edit }
        format.json { render json: @education.errors, status: :unprocessable_entity }
        format.js   { render :layout => false }
      end
    end
  end

  # DELETE /educations/1
  # DELETE /educations/1.json
  def destroy
    @education.destroy
    respond_to do |format|
      format.html { redirect_to @education, notice: 'Education was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  # CUSTOM ACTIONS

  def cancel
    respond_to do |format|
      format.js   { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education
      @education = Education.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_education_all
      @educations = Education::get_all_educations_from_user(@user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def education_params
      params.require(:education).permit(:degree_id, :study_field, :institution, :start_date, :end_date, :description)
    end

    def selects_form
      @degrees = Degree.all.where(:not_available == false)
    end
end
