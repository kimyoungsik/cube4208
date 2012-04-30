#encoding : UTF-8
class WeekreportsPdf < Prawn::Document
  include ActionView::Helpers::NumberHelper

  def initialize(weekreport,current_user)
    super(top_margin: 30)
    @weekreport = weekreport
    @team = @weekreport.team
    @user = current_user
    show_weekreports(@weekreport)
  end
  
  
  def show_weekreports(weekreport)
    font(Rails.public_path + "/NanumGothic.ttf") do
      table([[{:content =>"청년 등 사회적 기업가 육성사업\n", :width => 525, :align => :center, size: 15, :borders => [:top, :right, :left] }],[{:content =>"활 동   보 고 서", :borders => [:right, :left, :bottom], :align => :center, size: 20  }], ])
      move_down 15
      table([[{:content =>"팀 명 : #{@team.name}", :width => 265, :align => :left, :valign => :center, :height => 25  }, {:content =>"팀 원", :width => 80, :align => :center, :valign => :center  }, {:content =>"팀 대표", :width => 80, :align => :center, :valign => :center }, {:content =>"멘 토", :width => 100, :align => :center, :valign => :center }],[{:content =>"활동 참가자: #{@weekreport.participants}", :align => :left, :height => 25, :valign => :center},{:content =>"(인)", :align => :right, :valign => :center },{:content =>"#{@team.leader_user.korean_full_name}(인)", :align => :right, :valign => :center},{:content =>"#{@team.organization.name}(인)", :align => :right, :valign => :center}]])
     
      table([[{:content =>"활동 일시", :width => 140, :align => :center, :valign => :center, :height => 25 }, {:content =>"#{@weekreport.start.strftime("%Y년  %m월  %d일")} ~ #{@weekreport.end.strftime("%Y년  %m월  %d일")}", :width => 385, :align => :center, :valign => :center}],[{:content =>"활동 장소", :align => :center, :height => 25, :valign => :center},{:content =>"#{@weekreport.location}", :align => :center, :valign => :center}],[{:content =>"목적", :align => :center, :valign => :center},{:content =>"#{@weekreport.goal}", :align => :center, :height => 25, :valign => :center}],[{:content =>"내 용", :align => :center, :valign => :center},{:content => "#{@weekreport.contents}", :height => 270}],[{:content =>"결 과", :align => :center,:height => 150, :valign => :center},{:content => "#{@weekreport.result}"}]])
      move_down 15
      table([[{:content =>"위와 같이 활동 보고서를 제출합니다.", :width => 525, :align => :center, size: 10, :borders => [] }],[{:content => Date.today.strftime("%Y년  %m월  %d일"), :borders => [], :align => :center, size: 10  }],[{:content =>"작성자:#{@user.korean_full_name}(인)", :borders => [], size: 10, :align => :center }]])
      
      
    end
  end
end