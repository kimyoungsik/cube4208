#encoding : UTF-8
class WeeklyReportsPdf < Prawn::Document
  include ActionView::Helpers::NumberHelper

  def initialize(weekly_report,current_user)
    super(top_margin: 30)
    @weekly_report = weekly_report
    @team = @weekly_report.team
    @user = current_user
    show_weekly_reports(@weekly_report)
  end
  
  
  def show_weekly_reports(weekly_report)
    font(Rails.public_path + "/NanumGothic.ttf") do
      table([[{:content =>"청년 등 사회적 기업가 육성사업\n", :width => 525, :align => :center, size: 15, :borders => [:top, :right, :left] }],[{:content =>"주 간  활 동   보 고 서", :borders => [:right, :left, :bottom], :align => :center, size: 20  }], ])
      move_down 15
      table([[{:content =>"팀 명 : #{@team.name}", :width => 265, :align => :left, :valign => :center, :height => 25  }, {:content =>"팀 원", :width => 80, :align => :center, :valign => :center  }, {:content =>"팀 대표", :width => 80, :align => :center, :valign => :center }, {:content =>"멘 토", :width => 100, :align => :center, :valign => :center }],[{:content =>"활동 참가자: #{@weekly_report.participants}", :align => :left, :height => 25, :valign => :center},{:content =>"(인)", :align => :right, :valign => :center },{:content =>"#{@team.leader_user.korean_full_name unless @team.leader_user.nil?}(인)", :align => :right, :valign => :center},{:content =>"(인)", :align => :right, :valign => :center}]])
     
      table([[{:content =>"활동 일시", :width => 100, :align => :center, :valign => :center, :height => 25 }, {:content =>"#{@weekly_report.start_date.strftime("%Y년  %m월  %d일")} ~ #{@weekly_report.end_date.strftime("%Y년  %m월  %d일")}", :width => 425, :align => :center, :valign => :center}],[{:content =>"활동 장소", :width => 100, :align => :center, :height => 25, :valign => :center},{:content =>"#{@weekly_report.location}", :width => 425, :align => :center, :valign => :center}],[{:content =>"목적", :width => 100, :align => :center, :valign => :center},{:content =>"#{@weekly_report.purpose}", :width => 425, :align => :center, :height => 25, :valign => :center}],[{:content =>"내 용", :width => 100, :align => :center, :valign => :center},{:content => "#{@weekly_report.content}", :width => 425, :height => 270, :valign => :center, :leading => 5}],[{:content =>"결 과", :width => 100, :align => :center,:height => 150, :valign => :center},{:content => "#{@weekly_report.result}", :width => 425, :valign => :center, :leading => 5}]])
      move_down 15
      table([[{:content =>"위와 같이 활동 보고서를 제출합니다.", :width => 525, :align => :center, size: 15, :borders => [] }], [{:content => Date.today.strftime("%Y년  %m월  %d일"), :borders => [], :align => :center, size: 15  }],[{:content =>"작성자 :              (인)", :borders => [], size: 15, :align => :center }]])
    end
  end
end