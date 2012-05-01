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
  
  def status_user(status)
    case status
    when "pending"
      "대기"
    when "user-approved"
      "승인"
    when "mentor-approved"
      "맨토승인"
    end
  end
  
  def show_status(status)
    case status
    when "pending"
      "대기"
    when "user-approved"
      "일반유저"
    when "mentor-approved"
      "맨토"
    end
  end
  
end