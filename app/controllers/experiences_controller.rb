class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:edit, :new, :create, :update, :destroy, :cancel]
  before_action :set_experience_all, only: [:index, :edit, :new, :create, :update, :destroy, :cancel]

  # GET /experiences
  # GET /experiences.json
  def index
  end

  # GET /experiences/1
  # GET /experiences/1.json
  def show
  end

  # GET /experiences/new
  def new
    @experience = Experience.new
    respond_to do |format|
      format.js   { render :layout => false }
    end
  end

  # GET /experiences/1/edit
  def edit
    respond_to do |format|
      format.js   { render :layout => false }
    end
  end

  # POST /experiences
  # POST /experiences.json
  def create
    @experience = Experience.new(experience_params)
    @experience.user_id = @user.id
    respond_to do |format|
      if @experience.save
        format.html { redirect_to @experience, notice: 'Experience was successfully created.' }
        format.json { render :show, status: :created, location: @experience }
        format.js   { render :layout => false }
      else
        format.html { render :new }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
        format.js   { render :layout => false }
      end
    end
  end

  # PATCH/PUT /experiences/1
  # PATCH/PUT /experiences/1.json
  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to @experience, notice: 'Experience was successfully updated.' }
        format.json { render :show, status: :ok, location: @experience }
        format.js   { render :layout => false }
      else
        format.html { render :edit }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
        format.js   { render :layout => false }
      end
    end
  end

  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url, notice: 'Experience was successfully destroyed.' }
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
    def set_experience
      @experience = Experience.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_experience_all
      @experiences = Experience::get_all_experiences_from_user(@user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
      params.require(:experience).permit(:company, :position, :start_date, :end_date, :achievements)
    end
end
