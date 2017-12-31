class MypagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @best_time_5 = CompetitionResult.where(distance: 5).order(:calc_time).limit(1)
    @best_time_10 = CompetitionResult.where(distance: 10).order(:calc_time).limit(1)
    @best_time_21 = CompetitionResult.where(distance: 21).order(:calc_time).limit(1)
    @best_time_42 = CompetitionResult.where(distance: 42).order(:calc_time).limit(1)
    @best_time_100 = CompetitionResult.where(distance: 100).order(:calc_time).limit(1)
    @practices = current_user.practices.order(:day).limit(3).decorate
    #GoogleMap表示用に大会結果を全て取得
    @competition_results_all = current_user.competition_results
    #GoogleMap表示用データ取得
    @map = CompetitionResult.set_map(@competition_results_all)
    #マイペ0時の大会結果一覧表示用に直近３件のみ取得
    @competition_results = @competition_results_all.order(:day).limit(5)
  end
end
