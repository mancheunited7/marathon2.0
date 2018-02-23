class CompetitionResult < ApplicationRecord
  belongs_to :user

  mount_uploader :competition_result_photo, CompetitionResultPhotoUploader

  #住所から軽度、緯度を取得
  geocoded_by :address
  after_validation :geocode, if: Proc.new { |a| a.address_changed? }

  #GoogleMap表示用データ
  def self.set_map(competition_result)
    hash = Gmaps4rails.build_markers(competition_result) do |competition_result, marker|
      marker.lat competition_result.latitude
      marker.lng competition_result.longitude
      marker.infowindow competition_result.competition_name
    end
  end

end
