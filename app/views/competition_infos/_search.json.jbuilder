json.extract! competition_infos,
  :day,
  :name,
  :place,
  :site
json.url competition_infos_url(competition_infos, format: :json)
