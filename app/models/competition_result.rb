class CompetitionResult < ApplicationRecord
  belongs_to :user

  #住所から軽度、緯度を取得
  geocoded_by :address
  after_validation :geocode, if: Proc.new { |a| a.address_changed? }

  #GoogleMap表示のデータ
  def self.set_map(competition_result)
    hash = Gmaps4rails.build_markers(competition_result) do |competition_result, marker|
      marker.lat competition_result.latitude
      marker.lng competition_result.longitude
    end
  end

end
