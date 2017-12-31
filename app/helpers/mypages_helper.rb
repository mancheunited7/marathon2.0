module MypagesHelper
  def time(result)
    unless result.blank?
      unless result.hour.nil?
        hour = result.hour.to_s + "時間"
      else
        hour = ""
      end
      unless result.minute.nil?
        minute = result.minute.to_s + "分"
      else
        minute = ""
      end
      unless result.second.nil?
        second = result.second.to_s + "秒"
      else
        second = ""
      end
      hour + minute + second
    else
      return ""
    end
  end

  def distance(result)
    result.distance.to_s + "km"
  end

  def competition_point(result)
    result.competition_point.to_s + "点"
  end
end
