class UserLanguagesController < ApplicationController
  before_action :set_user_language, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:edit, :new, :create, :update, :destroy, :cancel]
  before_action :set_user_languages_all, only: [:index, :edit, :new, :create, :update, :destroy, :cancel]
  before_action :selects_form, only: [:new, :edit, :create, :update]

  # GET /user_languages
  # GET /user_languages.json
  def index
  end

  # GET /user_languages/1
  # GET /user_languages/1.json
  def show
  end

  # GET /user_languages/new
  def new
    @user_language = UserLanguage.new
    respond_to do |format|
      format.js   { render :layout => false }
    end
  end

  # GET /user_languages/1/edit
  def edit
    respond_to do |format|
      format.js   { render :layout => false }
    end
  end

  # POST /user_languages
  # POST /user_languages.json
  def create
    @user_language = UserLanguage.new(user_language_params)
    @user_language.user_id = @user.id
    respond_to do |format|
      if @user_language.save
        format.html { redirect_to @user_language, notice: 'User language was successfully created.' }
        format.json { render :show, status: :created, location: @user_language }
        format.js   { render :layout => false }
      else
        format.html { render :new }
        format.json { render json: @user_language.errors, status: :unprocessable_entity }
        format.js   { render :layout => false }
      end
    end
  end

  # PATCH/PUT /user_languages/1
  # PATCH/PUT /user_languages/1.json
  def update
    respond_to do |format|
      if @user_language.update(user_language_params)
        format.html { redirect_to @user_language, notice: 'User language was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_language }
        format.js   { render :layout => false }
      else
        format.html { render :edit }
        format.json { render json: @user_language.errors, status: :unprocessable_entity }
        format.js   { render :layout => false }
      end
    end
  end

  # DELETE /user_languages/1
  # DELETE /user_languages/1.json
  def destroy
    @user_language.destroy
    respond_to do |format|
      format.html { redirect_to user_languages_url, notice: 'User language was successfully destroyed.' }
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
    def set_user_language
      @user_language = UserLanguage.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_user_languages_all
      @user_languages = UserLanguage::get_all_user_languages_from_user(@user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_language_params
      params.require(:user_language).permit(:user_id, :language_level_id, :language_id)
    end

    def selects_form
      @languages = Language.all.where(:not_available == false)
      @language_levels = LanguageLevel.all.where(:not_available == false)
    end
end
