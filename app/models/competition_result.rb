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

  #ベスト記録用にタイムを秒換算
  def self.calc_time(result)
    unless result.hour.nil?
      hour = result.hour*3600
    else
      hour = 0
    end
    unless result.minute.nil?
      minute = result.minute*60
    else
      minute = 0
    end
    unless result.second.nil?
      second = result.second
    else
      second = 0
    end
    hour + minute + second
  end

end
