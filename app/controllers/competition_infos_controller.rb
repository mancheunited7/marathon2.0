class CompetitionInfosController < ApplicationController
  before_action :set_competition_info, only: [:show, :edit, :update, :destroy]

  require 'open-uri'
  require 'nokogiri'
  require 'date'

  def new
    @CompetitionInfo = CompetitionInfo.new
  end

  def index
    @search = CompetitionInfo.search(params[:q])
    binding.pry
    #@CompetitionInfos = CompetitionInfo.page(params[:page])
  end

  def search
    @q = CompetitionInfo.ransack(search_params)
    @CompetitionInfos = @q.result(distinct:true)
  end

  def create
    #チェックボックスの値を設定
    @CompetitionInfo_chk = CompetitionInfo.new(competitioninfo_params)
    #ロードの大会情報を取得する場合
    if @CompetitionInfo_chk.road == "1"
      #1〜12月分の情報を取得
      for i in 1..12 do
        #1月〜9月と10月以降で取得するurlを場合分け
        if i < 10
          url = "http://www.runnersbible.info/DB/DBM0" + i.to_s + ".html"
        else
          url = "http://www.runnersbible.info/DB/DBM" + i.to_s + ".html"
        end
        html = open(url) do |f|
          f.read
        end
        doc = Nokogiri::HTML.parse(html,nil,'utf-8')
        #取得先のテーブル情報が２種類あるので場合分け
        for j in 1..2 do
          if j == 1
            competition_info = doc.css('tr.tblo')
          else
            competition_info = doc.css('tr.tble')
          end
          competition_info.each do |info|
            @CompetitionInfo_road = CompetitionInfo.new
            #大会のHPアドレスがない場合は空白を設定
            if info.at("a").nil?
              @CompetitionInfo_road.name = info.css('td')[1].text
              @CompetitionInfo_road.site = ""
            else
              @CompetitionInfo_road.name = info.at("a").text
              site = info.at("a")
              @CompetitionInfo_road.site = site["href"]
            end
            day = info.at('td').text
            #日にちの情報取得のため年月日の値の(の位置を取得
            position = day.index("(")
            #月の値取得のため1月〜9月と10月以降で場合分け
            if i < 10
              #日にちの取得を１桁か二桁かで場合分け
              if position - 7 == 1
                day2 = day[0,4] + "年" + day[5,1] + "月" + day[7,1] + "日"
              else
                day2 = day[0,4] + "年" + day[5,1] + "月" + day[7,2] + "日"
              end
            else
              if position - 8 == 1
                day2 = day[0,4] + "年" + day[5,2] + "月" + day[8,1] + "日"
              else
                day2 = day[0,4] + "年" + day[5,2] + "月" + day[8,2] + "日"
              end
            end
            @CompetitionInfo_road.day = Date.strptime(day2,'%Y年%m月%d日')
            @CompetitionInfo_road.place = info.css('td')[2].text
            @CompetitionInfo_road.save
        end
      end
    end
  elsif @CompetitionInfo_chk.trail == "1"
      url = "https://www.mtsn.jp/race/"
      html = open(url) do |f|
        f.read
      end
      doc = Nokogiri::HTML.parse(html,nil,'utf-8')
      pagecount = doc.at("ul.pager .pager_arrow")
      competition_info = doc.css('.contents_list_detail')
      competition_info.each do |info|
        @CompetitionInfo_trail = CompetitionInfo.new
        @CompetitionInfo_trail.name = info.at("a").text
        day = info.at("dd.dt_entry_date").text
        @CompetitionInfo_trail.day = Date.strptime(day, '%Y年%m月%d日')
        @CompetitionInfo_trail.place = info.css("dl.scedule dd")[1].text
        site = info.at("a")
        @CompetitionInfo_trail.site = 'www.mtsn.jp/' + site["href"]
        @CompetitionInfo_trail.save
      end
    end
    redirect_to competition_infos_path
  end

  private
  def competitioninfo_params
    params.require(:competition_info).permit(:road, :trail)
  end

  def search_params
    params.require(:q).permit(:day_gte, :day_lteq, :name_cont_any, :place_cont_any, :prefecture_code)
  end
end
