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
        table([
                           [{:content => "연번", :width => 80, :height => 28, :align => :center, :valign => :center}, {:content => "지출내역서", :colspan => 2, :rowspan => 2, :width => 175, :align => :center, :valign => :center}, {:content => "결\n\n\n재", :rowspan => 2, :width => 30, :align => :center, :valign => :center}, {:content => "팀대표", :width => 80, :align => :center, :valign => :center}, {:content => "멘토", :width => 80, :align => :center, :valign => :center}, {:content => "참여기관", :width => 80, :align => :center, :valign => :center}],
                           [{:content => count.to_s, :height  => 52, :align => :center, :valign => :center}, {:content => "(인)", :align => :right, :valign => :center}, {:content => "(인)", :align => :right, :valign => :center}, {:content => "(인)", :align => :right, :valign => :center}],
                           [{:content => "팀명", :height  => 38, :align => :center, :valign => :center}, {:content => @team.name, :colspan => 3, :align => :center, :valign => :center}, {:content => "관항목", :rowspan => 2, :align => :center, :valign => :center}, {:content => "#{get_item(entry)}", :colspan => 2, :rowspan => 2, :align => :center, :valign => :center}],
                           [{:content => "금액", :rowspan => 4, :height => 155, :align => :center, :valign => :center}, {:content => "공급가액", :align => :center, :valign => :center}, {:content => "", :colspan => 2, :align => :center, :valign => :center}],
                           [{:content => "부가세", :align => :center, :valign => :center}, {:content => "", :colspan => 2, :align => :center, :valign => :center}, {:content => "지출일자", :align => :center, :valign => :center}, {:content => entry.invoice_datetime.strftime("%Y-%m-%d %H:%M:%S"), :colspan => 2, :align => :center, :valign => :center}],
                           [{:content => "합계", :rowspan => 2, :align => :center, :valign => :center}, {:content => "#{number_to_korean(entry.amount)}원 정 \n\n ( #{number_with_delimiter(entry.amount)}원 )", :colspan => 2, :rowspan => 2, :align => :center, :valign => :center}, {:content => "지급방법", :align => :center, :valign => :center}, {:content => entry.payment_method, :colspan => 2, :align => :center, :valign => :center}],
                           [{:content => "지급처", :align => :center, :valign => :center}, {:content => entry.vendor, :colspan => 2, :align => :center, :valign => :center}]])
             move_down 15
            table([[{:content => "적요", :align => :center, :valign => :center, :height => 344, :width => 80}, {:content => "#{entry.summary unless entry.summary.nil?}", :colspan => 6, :valign => :center, :width => 445}]])
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
      table([[{:content =>"본인은 청년 등 사회적기입가 육성사업 수행과 관련하여 상기와 같이", :width => 525, :align => :center, size: 15, :borders => [] }],[{:content =>"사업비 사용계획서와 활동비 사용 신청서를 제출합니다.", :borders => [], :align => :center, size: 15}],[{:content =>"", :borders => [], :align => :center, :height => 20}],[{:content => Date.today.strftime("%Y년  %m월  %d일"), :borders => [], :align => :center, size: 15  }],[{:content =>"", :borders => [], :align => :center, :height => 20}],[{:content =>"창업팀 대표:           (서명)", :borders => [], :align => :center, size: 15  }],[{:content =>"", :borders => [], :align => :center, :height => 30}], [{:content =>"한국사회적기업진흥원 귀하", :borders => [], :align => :center, size: 30  }]])    
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