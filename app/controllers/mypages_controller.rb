class MypagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @best_time_5 = CompetitionResult.where(distance: 5).order(:calc_time).first
    @best_time_10 = CompetitionResult.where(distance: 10).order(:calc_time).first
    @best_time_21 = CompetitionResult.where(distance: 21.0975).order(:calc_time).first
    @best_time_42 = CompetitionResult.where(distance: 42.195).order(:calc_time).first
    @best_time_100 = CompetitionResult.where(distance: 100).order(:calc_time).first
    @graph_data = current_user.practices.order(:day).limit(10)
    @distance_data = @graph_data.pluck(:day, :distance)
    @weight_data = @graph_data.pluck(:day, :weight)
    @practices = current_user.practices.order(day: "DESC").limit(3).decorate
    #GoogleMap表示用に大会結果を全て取得
    @competition_results_all = current_user.competition_results
    #GoogleMap表示用データ取得
    @map = CompetitionResult.set_map(@competition_results_all)
    @competition_results = @competition_results_all.order(day: "DESC").limit(5)
    @users = User.all
  end
end
