class Api::V1::UserInfosController < ApplicationController
    before_action :set_user_info, only: %i[ show edit update destroy ]
      
    def index
        @user_infos = UserInfo.all
        
        render json: @user_infos
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
    @user_info = UserInfo.new(user_info_params)

    respond_to do |format|
        if @user_info.save
        format.html { redirect_to @user_info, notice: "user_info was successfully created." }
        format.json { render :show, status: :created, location: @user_info}
        else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_info.errors, status: :unprocessable_entity }
        end
    end
    end

    def update
    respond_to do |format|
        if @user_info.update(user_info_params)
        format.html { redirect_to @user_info_subject, notice: "user_info was successfully updated." }
        format.json { render :show, status: :ok, location: @user_info }
        else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_info.errors, status: :unprocessable_entity }
        end
    end
    end

    def destroy
    @user_info.destroy
    respond_to do |format|
        format.html { redirect_to user_info_url, notice: "user_info was successfully destroyed." }
        format.json { head :no_content }
    end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_info
        @user_info = UserInfo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_info_params
        params.require(:user_info).permit(:first_name, :last_name, :about, :suburb)
    end
end
