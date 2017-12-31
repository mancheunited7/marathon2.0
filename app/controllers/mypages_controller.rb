class MypagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @practices = current_user.practices.order(:day).limit(3)
    @competition_results = current_user.competition_results.order(:day).limit(5)
    @map = CompetitionResult.set_map(@competition_results)
  end
end
