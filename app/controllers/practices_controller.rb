class PracticesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_practice, only: [:show, :edit, :update, :destroy]

  # GET /practices
  # GET /practices.json
  def index
    @practices = Practice.all
  end

  # GET /practices/1
  # GET /practices/1.json
  def show
  end

  def new
    @practice = Practice.new
  end

  def edit
  end

  def create
    @practice = Practice.new(practice_params)
    @practice.user_id = current_user.id
    @practice.lap = calc_time(@practice)
    if @practice.save
      redirect_to mypages_path, notice: '練習記録を登録しました!!'
    else
      render 'new'
    end
  end

  # PATCH/PUT /practices/1
  # PATCH/PUT /practices/1.json
  def update
    respond_to do |format|
      if @practice.update(practice_params)
        format.html { redirect_to @practice, notice: 'Practice was successfully updated.' }
        format.json { render :show, status: :ok, location: @practice }
      else
        format.html { render :edit }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /practices/1
  # DELETE /practices/1.json
  def destroy
    @practice.destroy
    respond_to do |format|
      format.html { redirect_to practices_url, notice: 'Practice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_practice
      @practice = Practice.find(params[:id])
    end

    def practice_params
      params.require(:practice).permit(:day, :weather, :temperature, :humidity, :wind_speed, :distance, :hour, :minute, :second, :content, :weight, :body_fat, :heart_rate, :practice_photo, :practice_photo_cache)
    end
end
