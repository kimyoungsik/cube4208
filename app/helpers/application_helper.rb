#encoding:utf-8
module ApplicationHelper
  def youtube_thumb(youtube_video_id)
    image_tag "http://img.youtube.com/vi/#{youtube_video_id}/2.jpg"
  end
  
  def status_in_korean(status)
    case status
    when "pending"
      "대기"
    when "approved"
      "승인"
    when "rejected"
      "거절"

    end
  end
  
  def status_label(status)
    case status
    when "pending"
      "warning"
    when "approved"
      "success"
    when "rejected"
      "danger"
    end
  end
end