class CompetitionResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_competition_result, only: [:show, :edit, :update, :destroy]

  # GET /competition_results
  # GET /competition_results.json
  def index
    @competition_results = CompetitionResult.all
  end

  # GET /competition_results/1
  # GET /competition_results/1.json
  def show
  end

  def new
    @competition_result = CompetitionResult.new
  end

  # GET /competition_results/1/edit
  def edit
  end

  def create
    @competition_result = CompetitionResult.new(competition_result_params)
    @competition_result.competition_place = @competition_result.address
    @competition_result.user_id = current_user.id
    if @competition_result.save
      redirect_to mypages_path, notice: '大会結果を登録しました!!'
    else
      render 'new'
    end
  end

  # PATCH/PUT /competition_results/1
  # PATCH/PUT /competition_results/1.json
  def update
    respond_to do |format|
      if @competition_result.update(competition_result_params)
        format.html { redirect_to @competition_result, notice: 'Competition result was successfully updated.' }
        format.json { render :show, status: :ok, location: @competition_result }
      else
        format.html { render :edit }
        format.json { render json: @competition_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competition_results/1
  # DELETE /competition_results/1.json
  def destroy
    @competition_result.destroy
    respond_to do |format|
      format.html { redirect_to competition_results_url, notice: 'Competition result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_competition_result
    @competition_result = CompetitionResult.find(params[:id])
  end

  def competition_result_params
    params.require(:competition_result).permit(:user_id, :day, :address, :competition_place, :latitude, :longitude, :distance, :competition_name, :hour, :minute, :second, :calctime, :heart_rate, :content, :avatar, :avatar_cache, :competition_point, :competition_memmo )
  end
end
