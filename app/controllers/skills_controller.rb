class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:edit, :new, :create, :update, :destroy, :cancel]
  before_action :set_skill_all, only: [:index, :edit, :new, :create, :update, :destroy, :cancel]

  # GET /skills
  # GET /skills.json
  def index
  end

  # GET /skills/1
  # GET /skills/1.json
  def show
  end

  # GET /skills/new
  def new
    @skill = Skill.new
    respond_to do |format|
      format.js   { render :layout => false }
    end
  end

  # GET /skills/1/edit
  def edit
    respond_to do |format|
      format.js   { render :layout => false }
    end
  end

  # POST /skills
  # POST /skills.json
  def create
    @skill = Skill.new(skill_params)
    @skill.user_id = @user.id
    respond_to do |format|
      if @skill.save
        # User Validation Profile
        @errors = User.validate_user_complete_errors(@user)
        format.html { redirect_to @skill, notice: 'Skill was successfully created.' }
        format.json { render :show, status: :created, location: @skill }
        format.js   { render :layout => false }
      else
        format.html { render :new }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
        format.js   { render :layout => false }
      end
    end
  end

  # PATCH/PUT /skills/1
  # PATCH/PUT /skills/1.json
  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to @skill, notice: 'Skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill }
        format.js   { render :layout => false }
      else
        format.html { render :edit }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
        format.js   { render :layout => false }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill.destroy
    # User Validation Profile
    @errors = User.validate_user_complete_errors(@user)
    respond_to do |format|
      format.html { redirect_to skills_url, notice: 'Skill was successfully destroyed.' }
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
    def set_skill
      @skill = Skill.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_skill_all
      @skills = Skill::get_all_skills_from_user(@user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_params
      params.require(:skill).permit(:skill, :knowledge_percentage)
    end
end
