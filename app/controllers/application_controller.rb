class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  PERMISSIBLE_ATTRIBUTES = %i(name avatar avatar_cache)

  #ベスト記録積算用/ラップタイム計算用にタイムを秒換算
  def calc_time(result)
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
    if controller_name == "practices"
      (hour + minute + second)/result.distance
    else
      hour + minute + second
    end

  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: PERMISSIBLE_ATTRIBUTES)
    devise_parameter_sanitizer.permit(:account_update, keys: PERMISSIBLE_ATTRIBUTES)
  end
end
