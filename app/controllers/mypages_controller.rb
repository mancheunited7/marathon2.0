class MypagesController < ApplicationController
  def index
    @practices = current_user.practices.order(:day).limit(3)
    @competition_results = current_user.competition_results.order(:day).limit(5)
  end
end
