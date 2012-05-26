#encoding : UTF-8
class EntriesPdf < Prawn::Document
  include ActionView::Helpers::NumberHelper
  
  def initialize(entries)
    super(top_margin: 30)
    @entries = entries
    @team = @entries.first.team
    apply(@entries)
    font(Rails.public_path + "/NanumGothic.ttf") do
      header
      table summary do
        # self.row_colors = ["DDDDDD", "FFFFFF"]
        self.header = true
        self.width = 525
      end
      total
      footer
    end
    show_entries(@entries)
  end
  
  def show_entries(entries)
    
    font(Rails.public_path + "/NanumGothic.ttf") do

      count = 1
      entries.each do |entry|
        start_new_page()
        
        table([[{:content =>"지 출 결 의 서", :width => 400, :align => :center, :rowspan => 2, size: 20, :valign => :center, :height => 60}, {:content =>"결\n\n\n재", :width => 25, :align => :center, :rowspan => 2}, {:content =>"팀대표", :width => 100, :align => :center, :height => 20, :valign => :center }],[{:content =>"#{@team.leader_user.korean_full_name unless @team.leader_user.nil?} (인)", :align => :center, :height => 40, :valign => :center}]])
        table([[{:content =>"팀 명", :width => 50, :align => :center, :valign => :center, :height => 25  }, {:content =>"#{@team.name}", :width => 250, :align => :center, :valign => :center  },{:content =>"지급방법", :width => 60, :align => :center, :valign => :center, :height => 25  }, {:content =>"#{entry.pay_method.name unless entry.pay_method.nil?}", :width => 165, :align => :center, :valign => :center  }]])
        table([[{:content =>"금 액", :width => 50, :align => :center, :valign => :center, :height => 25  }, {:content =>"#{number_to_korean(entry.amount)}원정(#{number_with_delimiter(entry.amount)})", :width => 250, :align => :center, :valign => :center, :height => 25}, {:content =>"지급처", :width => 60, :align => :center, :valign => :center  }, {:content => entry.vendor, :width => 165, :align => :center, :valign => :center }],
               [{:content =>"지출일자", :width => 50, :align => :center, :valign => :center, :height => 25  }, {:content => entry.invoice_datetime.strftime("%Y-%m-%d"), :width => 250, :align => :center, :valign => :center, :height => 25  }, {:content =>"관항목", :width => 60, :align => :center, :valign => :center}, {:content => "#{get_item(entry)}", :width => 165, :align => :center, :valign => :center }]])
        table([[{:content =>"적요", :width => 50, :align => :center, :valign => :center, :height => 100  }, {:content =>"#{"목적\n"+entry.purpose+"\n\n" unless entry.purpose.nil?}     #{"세부내역\n"+entry.summary unless entry.summary.nil?}", :width => 475, :align => :left, :valign => :center, :height => 75, :size => 10}],
               [{:content =>"증빙첨부란", :width => 50, :align => :center, :valign => :center, :height => 480, :size => 10  }, {:content => "", :width => 475, :align => :center, :valign => :center, :height => 200}]])
        
        for business_trip_report in entry.business_trip_reports
          start_new_page()
          table([[{:content =>"청년 등 사회적 기업가 육성사업\n", :width => 525, :align => :center, size: 15, :borders => [:top, :right, :left] }],[{:content =>"출 장 보 고 서", :borders => [:right, :left, :bottom], :align => :center, size: 20  }], ])
          move_down 5
          table([[{:content =>"팀 명 : #{@team.name}", :width => 265, :align => :left, :valign => :center, :height => 25  }, {:content =>"팀 원", :width => 80, :align => :center, :valign => :center  }, {:content =>"팀 대표", :width => 80, :align => :center, :valign => :center }, {:content =>"멘 토", :width => 100, :align => :center, :valign => :center }],[{:content =>"출 장 자: #{business_trip_report.participants}", :align => :left, :height => 25, :valign => :center},{:content =>"(인)", :align => :right, :valign => :center },{:content =>"#{@team.leader_user.korean_full_name unless @team.leader_user.nil?}(인)", :align => :right, :valign => :center},{:content =>"(인)", :align => :right, :valign => :center}]])
          table([[{:content =>"출장 일시", :width => 100, :align => :center, :valign => :center, :height => 25 }, {:content =>"#{
  			   business_trip_report.start.strftime("%Y-%m-%d %H:%M")+"~"+business_trip_report.end.strftime("%Y-%m-%d %H:%M")}", :width => 425, :align => :center, :valign => :center}],[{:content =>"출장 목적", :width => 100, :align => :center, :height => 25, :valign => :center},{:content =>"#{business_trip_report.perpose}", :width => 425, :align => :center, :valign => :center}],[{:content =>"출장지", :width => 100, :align => :center, :valign => :center},{:content =>"#{business_trip_report.location}", :width => 425, :align => :center, :height => 25, :valign => :center}],[{:content =>"면담자", :width => 100, :align => :center, :valign => :center},{:content =>"#{business_trip_report.interviewee}", :width => 425, :align => :center, :height => 25, :valign => :center}],[{:content =>"주 요 내 용", :width => 100, :align => :center, :valign => :center},{:content => "#{business_trip_report.content}", :width => 425, :height => 330, :valign => :center, :leading => 5}],[{:content =>"의 견", :width => 100, :align => :center,:height => 170, :valign => :center},{:content => "#{business_trip_report.result}", :width => 425, :valign => :center, :leading => 5}]])
              
          start_new_page()
           table([[{:content =>"청년 등 사회적 기업가 육성사업\n", :width => 525, :align => :center, size: 15, :borders => [] }],[{:content =>"여 비 정 산 서", :borders => [], :align => :center, size: 20  }], ])
           move_down 15
           table([[{:content =>"팀 명", :width => 100, :align => :center, :valign => :center, :height => 25  }, {:content =>"#{@team.name}", :width => 155, :align => :center, :valign => :center, :height => 25  }, {:content =>"팀대표", :width => 50, :align => :center, :valign => :center  }, {:content =>"#{@team.leader_user.korean_full_name unless @team.leader_user.nil?}(인)", :width => 85, :align => :center, :valign => :center }, {:content =>"멘 토", :width => 50, :align => :center, :valign => :center }, {:content =>"(인)", :width => 85, :align => :right, :valign => :center}]])
           move_down 15
           table([[{:content =>"출장자", :width => 100, :align => :center, :valign => :center, :height => 25 }, {:content =>"#{business_trip_report.participants}", :width => 425, :align => :center, :valign => :center}]])
           table([
               [{:content => "출장일정", :rowspan => 3, :width => 50, :align => :center, :valign => :center, :height => 75, :size => 10}, {:content => "일시", :width => 50, :align => :center, :valign => :center, :height => 25, :size => 10}, {:content => "#{
       			   business_trip_report.start.strftime("%Y-%m-%d %H:%M")+"~"+business_trip_report.end.strftime("%Y-%m-%d %H:%M")}",  :align => :center, :valign => :center, :height => 25}],
               [{:content => "출장목적", :width => 50, :align => :center, :valign => :center, :height => 25, :size => 10}, {:content => "#{business_trip_report.perpose}", :width => 425,  :align => :center, :valign => :center, :height => 25}],
               [{:content => "출장지", :width => 50, :align => :center, :valign => :center, :height => 25, :size => 10}, {:content => "#{business_trip_report.location}", :width => 425,  :align => :center, :valign => :center, :height => 25}]
           ])
           total_amount = 0
           for expense in business_trip_report.expenses
             case expense.classification
             when "transportation"
               transportation_date = expense.date.strftime("%m. %d")
               transportation_amount = expense.amount
               transportation_pay_method = expense.pay_method.name
               transportation_note = expense.note                
             when "accommodation"
               accommodation_date = expense.date.strftime("%m. %d")
               accommodation_amount = expense.amount
               accommodation_pay_method = expense.pay_method.name
               accommodation_note = expense.note
             when "food"
               food_date = expense.date.strftime("%m. %d")
               food_amount = expense.amount
               food_pay_method = expense.pay_method.name
               food_note = expense.note
             when "daily"
               daily_date = expense.date.strftime("%m. %d")
               daily_amount = expense.amount
               daily_pay_method = expense.pay_method.name
               daily_note = expense.note
             end 
             total_amount = total_amount.to_i + expense.amount.to_i
           end

           table([

             [{:content => "구분", :width => 100, :align => :center, :valign => :center, :height => 25, :size => 10},  {:content => "일수/일과", :width => 100, :align => :center, :valign => :center, :height => 25, :size => 10}, {:content => "사용금액", :width => 100, :align => :center, :valign => :center, :height => 25, :size => 10}, {:content => "결제방법", :width => 100, :align => :center, :valign => :center, :height => 25, :size => 10}, {:content => "비고", :width => 125, :align => :center, :valign => :center, :height => 25, :size => 10}],
             [{:content => "교통비", :width => 100, :align => :center, :valign => :center, :height => 50, :size => 10},  {:content => "#{transportation_date unless transportation_date.nil?}", :width => 100, :align => :center, :valign => :center, :height => 50, :size => 10}, {:content => "#{number_with_delimiter(transportation_amount)+'원' unless transportation_amount.nil?}", :width => 100, :align => :center, :valign => :center, :height => 25, :size => 10}, {:content => "#{transportation_pay_method unless transportation_pay_method.nil?}", :width => 100, :align => :center, :valign => :center, :height => 25, :size => 10}, {:content => "#{transportation_note unless transportation_note.nil?}", :width => 125, :align => :center, :valign => :center, :height => 25, :size => 10}],
             [{:content => "숙박비(1일)", :width => 100, :align => :center, :valign => :center, :height => 50, :size => 10},  {:content => "#{accommodation_date unless accommodation_date.nil?}", :width => 100, :align => :center, :valign => :center, :height => 50, :size => 10}, {:content => "#{number_with_delimiter(accommodation_amount)+'원' unless accommodation_amount.nil?}", :width => 100, :align => :center, :valign => :center, :height => 25, :size => 10}, {:content => "#{accommodation_pay_method unless accommodation_pay_method.nil?}", :width => 100, :align => :center, :valign => :center, :height => 25, :size => 10}, {:content => "#{accommodation_note unless accommodation_note.nil?}", :width => 125, :align => :center, :valign => :center, :height => 25, :size => 10}],
             [{:content => "식비(1일)", :width => 100, :align => :center, :valign => :center, :height => 50, :size => 10},  {:content => "#{food_date unless food_date.nil?}", :width => 100, :align => :center, :valign => :center, :height => 50, :size => 10}, {:content => "#{number_with_delimiter(food_amount)+'원' unless food_amount.nil?}", :width => 100, :align => :center, :valign => :center, :height => 25, :size => 10}, {:content => "#{food_pay_method unless food_pay_method.nil?}", :width => 100, :align => :center, :valign => :center, :height => 25, :size => 10}, {:content => "#{food_note unless food_note.nil?}", :width => 125, :align => :center, :valign => :center, :height => 25, :size => 10}],
             [{:content => "일비(1일)", :width => 100, :align => :center, :valign => :center, :height => 50, :size => 10},  {:content => "#{daily_date unless daily_date.nil?}", :width => 100, :align => :center, :valign => :center, :height => 50, :size => 10}, {:content => "#{number_with_delimiter(daily_amount)+'원' unless daily_amount.nil?}", :width => 100, :align => :center, :valign => :center, :height => 25, :size => 10}, {:content => "#{daily_pay_method unless daily_pay_method.nil?}", :width => 100, :align => :center, :valign => :center, :height => 25, :size => 10}, {:content => "#{daily_note unless daily_note.nil?}", :width => 125, :align => :center, :valign => :center, :height => 25, :size => 10}]

           ])

           table([[{:content => "합계", :width => 300, :align => :center, :valign => :center, :height => 25},  {:content => "#{number_with_delimiter(total_amount)+'원' unless total_amount.nil?}", :width => 225, :align => :center, :valign => :center, :height => 25}]])
           table([[{:content => "#{business_trip_report.note}", :width => 525, :align => :center, :valign => :center, :height => 90, :leading => 5}]])
           move_down 10
           table([[{:content =>"위와 같이 여비의 정산을 하였음.", :width => 525, :align => :center, size: 15, :borders => [] }], [{:content =>"", :width => 525, :align => :center, size: 15, height: 20, :borders => [] }], [{:content => Date.today.strftime("%Y년  %m월  %d일"), :borders => [], :align => :center, size: 15  }], [{:content =>"", :width => 525, :align => :center, size: 15, height: 20, :borders => [] }], [{:content =>"작성자 :                (인)", :borders => [], size: 15, :align => :center }]])
        end     
          
        for meeting in entry.meetings
          start_new_page()
          table([[{:content =>"청년 등 사회적 기업가 육성사업\n", :width => 525, :align => :center, size: 15, :borders => [] }],[{:content =>"회 의 록", :borders => [], :align => :center, size: 20  }], ])
          move_down 15
          table([[{:content =>"팀 명", :width => 100, :align => :center, :valign => :center, :height => 25  }, {:content =>"#{@team.name}", :width => 155, :align => :center, :valign => :center, :height => 25  }, {:content =>"팀대표", :width => 50, :align => :center, :valign => :center  }, {:content =>"#{@team.leader_user.korean_full_name unless @team.leader_user.nil?}(인)", :width => 85, :align => :center, :valign => :center }, {:content =>"멘 토", :width => 50, :align => :center, :valign => :center }, {:content =>"(인)", :width => 85, :align => :right, :valign => :center}]])
          move_down 20
          table([[{:content =>"회의 일시", :width => 100, :align => :center, :valign => :center, :height => 25 }, {:content =>"#{
  			   meeting.start.strftime("%Y-%m-%d %H:%M")+"~"+meeting.end.strftime("%Y-%m-%d %H:%M")}", :width => 425, :align => :center, :valign => :center}],[{:content =>"회의 참석자", :width => 100, :align => :center, :height => 25, :valign => :center},{:content =>"#{meeting.participants}", :width => 425, :align => :center, :valign => :center}],[{:content =>"회의장소", :width => 100, :align => :center, :valign => :center},{:content =>"#{meeting.location}", :width => 425, :align => :center, :height => 25, :valign => :center}],[{:content =>"회의 안건", :width => 100, :align => :center, :valign => :center},{:content =>"#{meeting.perpose}", :width => 425, :align => :center, :height => 25, :valign => :center}],[{:content =>"회 의  내 용", :width => 100, :align => :center, :valign => :center},{:content => "#{meeting.content}", :width => 425, :height => 350, :valign => :center}]])
          table([[{:content =>"위와 같이 회의에 참석하였음을 확인합니다.", :width => 525, :align => :center, size: 15, :borders => [:left, :right] }], [{:content =>"", :width => 525, :align => :center, size: 15, height: 20, :borders => [:left, :right] }], [{:content => Date.today.strftime("%Y년  %m월  %d일"), :borders => [:left, :right, :bottom], :align => :center, size: 15  }], [{:content =>"", :width => 525, :align => :center, size: 15, height: 20, :borders => [] }]])
         
          start_new_page()
          table([[{:content =>"청년 등 사회적 기업가 육성사업\n", :width => 525, :align => :center, size: 15, :borders => [] }],[{:content =>"회 의 록", :borders => [], :align => :center, size: 20  }], ])
          move_down 20
          table([
              [{:content => "회의참석자", :rowspan => 21, :width => 100, :align => :center, :valign => :center, :height => 250}, {:content => "소속 및 직위", :width => 225, :align => :center, :valign => :center, :height => 25}, {:content => "성명", :width => 100, :align => :center, :valign => :center, :height => 25}, {:content => "서명", :width => 100, :align => :center, :valign => :center, :height => 25}],
              [{:content => "", :width => 225, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}],
              [{:content => "", :width => 225, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}],
              [{:content => "", :width => 225, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}],
              [{:content => "", :width => 225, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}],
              [{:content => "", :width => 225, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}],
              [{:content => "", :width => 225, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}],
              [{:content => "", :width => 225, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}],
              [{:content => "", :width => 225, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}],
              [{:content => "", :width => 225, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}],
              [{:content => "", :width => 225, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}],
              [{:content => "", :width => 225, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}],
              [{:content => "", :width => 225, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}],
              [{:content => "", :width => 225, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}],
              [{:content => "", :width => 225, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}],
              [{:content => "", :width => 225, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}],
              [{:content => "", :width => 225, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}],
              [{:content => "", :width => 225, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}],
              [{:content => "", :width => 225, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}],
              [{:content => "", :width => 225, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}],
              [{:content => "", :width => 225, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}, {:content => "", :width => 100, :align => :center, :valign => :center, :height => 25}]
              
              ])
        end
          
        for photo in entry.photos
          start_new_page()
          pic = "#{Rails.public_path + photo.image_url}"
          image pic, :at => [20,670], :width => 525, :height => 600   
        end
            
        count += 1
      end
    end
  end
  
  def header
    start_new_page()
    table([[{:content =>"청년 등 사회적 기업가 육성사업\n", :width => 525, :align => :center, size: 10, :borders => [:top, :right, :left] }],[{:content =>"( #{@entries.first.invoice_datetime.month} 월 ) 활동비 사용 내역서", :borders => [:right, :left, :bottom], :align => :center, size: 20  }], ])
   
  end
  
  def summary
    count = 0
    move_down 15
    [[{:content =>"연 번", :width => 40, :align => :center, :valign => :center }, {:content =>"날 짜", :width => 40, :align => :center, :valign => :center }, {:content =>"사용용도", :width => 190, :align => :center, :valign => :center }, {:content =>"금 액 (원)", :width => 150, :align => :center, :valign => :center } ,{:content =>"비 고", :align => :center, :valign => :center }]] +
    @entries.map do |entry|
      [{:content => (count += 1).to_s, :align => :center, :valign => :center }, {:content =>entry.invoice_datetime.month.to_s + ". " +entry.invoice_datetime.day.to_s, :align => :center, :valign => :center }, {:content => get_item(entry), :align => :center, :valign => :center }, {:content => number_with_delimiter(entry.amount), :align => :center, :valign => :center }, "" ]
    end
  end
  
  def total
    table ([[{:content => "합계", :align => :center, :width => 80},{:content => "#{number_with_delimiter(@entries.map(&:amount).inject(:+))}원", :width => 445, :align => :center }]])
  end
  
  def footer
    move_down 15
    text "※ 신청 내용이 없을 경우 '해당 없음' 으로 표기"
  end
  
  def apply(entries)
    font(Rails.public_path + "/NanumGothic.ttf") do
      table([[{:content =>"청년 등 사회적 기업가 육성사업\n", :width => 525, :align => :center, size: 10, :borders => [:top, :right, :left] }],[{:content =>"( #{entries.first.invoice_datetime.month} 월 ) 활동비 사용 신청서", :borders => [:right, :left, :bottom], :align => :center, size: 20  }], ])
    
      move_down 15
      text "1. 신청자"
      move_down 4
      table([[{:content => "창 업 팀 명", :width => 100, :align => :center, :height => 30, :valign => :center},{:content => @team.name, :width => 425, :valign => :center}]])
      move_down 15
      text "2. 수령인"
      move_down 4
      table([[{:content => "창 업 팀", :width => 100, :align => :center, :valign => :center },{:content => @team.name, :width => 225}, {:content => "대 표 자", :width => 70, :align => :center, :valign => :center }, {:content => @team.leader_user.korean_full_name, :width => 130, :align => :center, :valign => :center }],
            [{:content => "은 행 명(지 점)", :width => 100, :align => :center, :valign => :center },{:content => "#{@team.bank_branch if !@team.bank_branch.nil?}", :width => 225}, {:content => "예 금 주" , :width => 70, :align => :center, :valign => :center }, {:content => @team.leader_user.korean_full_name, :width => 130, :align => :center, :valign => :center }], 
            [{:content => "계 좌 번 호 ", :width => 100, :align => :center, :valign => :center }, {:content => "#{@team.account_number if !@team.account_number.nil?}", :colspan => 3, :align => :center, :valign => :center }]])
      move_down 10
      text "※ 대표자와 예금주는 동일해야 함"
      move_down 15
      text "3. 신청내역"
      move_down 4
      uniq_items = entries.map{|x| x.item}.uniq.compact.sort
      table([[{:content => "구 분", :width => 140, :align => :center, :valign => :center },{:content => "활동비", :colspan => 2, :align => :center, :width => 385}],
            [{:content => "신 청 액", :align => :center, :valign => :center },{:content => number_with_delimiter(entries.map(&:amount).inject(:+))+"원", :align => :center, :colspan => 2}],
            [{:content => "지 급 사 유", :align => :center, :valign => :center },{:content => "사업추진에 필요한 활동비 집행", :colspan => 2, :align => :center, :valign => :center }]
            ] +
      uniq_items.map do |item|
        if item == uniq_items.first
          [{:content => "지 출 항 목", :rowspan => uniq_items.length, :align => :center, :valign => :center }, {:content => item.category.name, :align => :center, :valign => :center}, {:content => item.name, :align => :center, :valign => :center}]
        else
          [{:content => item.category.name, :align => :center, :valign => :center}, {:content => item.name, :align => :center, :valign => :center}]
        end
      end
      )
      
      move_down 10
      table([[{:content => "[첨부서류]", :width => 70, :align => :center, :rowspan => 2, :borders => []},{:content =>"1. 활동비 사용내역서 1부.", :width => 455, :borders => []}]])
      move_down 20
      table([[{:content =>"본인은 청년 등 사회적기입가 육성사업 수행과 관련하여 상기와 같이", :width => 525, :align => :center, size: 15, :borders => [] }],[{:content =>"사업비 사용계획서와 활동비 사용 신청서를 제출합니다.", :borders => [], :align => :center, size: 15}],[{:content =>"", :borders => [], :align => :center, :height => 20}],[{:content => Date.today.strftime("%Y년  %m월  %d일"), :borders => [], :align => :center, size: 15  }],[{:content =>"", :borders => [], :align => :center, :height => 20}],[{:content =>"창업팀 대표:           #{@team.leader_user.korean_full_name}            (서명)", :borders => [], :align => :center, size: 15  }],[{:content =>"", :borders => [], :align => :center, :height => 30}], [{:content =>"한국사회적기업진흥원 귀하", :borders => [], :align => :center, size: 30  }]])    
    end
  end
  
  
  def get_item(entry)
    items = ""    
    items = items + entry.item.category.name if !entry.item.nil?
    items = items + "-" + entry.item.name if !entry.item.nil?
    items
  end
  
  def number_to_korean(number)
    number_string = ''
    number_array = number.to_s.split("").map {|i| i.to_i}
    number_array.reverse!
    count = 1
    number_array.each do |digit|
      number_string = surfix_to_word(digit, count) + number_string
      count += 1
    end
    number_string
  end
  
  def surfix_to_word(digit, position)
    surfix = ""
    unless digit == 0 and position != 5
      case position
      when 0
        surfix = ""
      when 1
        surfix = ""
      when 2
        surfix = "십"
      when 3
        surfix = "백"
      when 4
        surfix = "천"
      when 5
        surfix = "만"
      when 6
        surfix = "십"
      when 7
        surfix = "백"
      when 8
        surfix = "천"
      when 9
        surfix = "억"
      end
    end
    digit_to_word(digit) + surfix
  end
  
  def digit_to_word(digit)
    case digit
    when 0
      ""
    when 1
      "일"
    when 2
      "이"
    when 3
      "삼"
    when 4
      "사"
    when 5
      "오"
    when 6
      "육"
    when 7
      "칠"
    when 8
      "팔"
    when 9
      "구"
    end
  end
end