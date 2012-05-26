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
  
  def position(user)
    if user.user_approved?
      return "#{user.team.name} 멤버"
    elsif user.mentor_approved?
      return "#{user.organization.name} 멘토"
    elsif user.head_approved?
      return "#{user.head_organization.name} 관리자"
    else
      return ""
    end
  end
  
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "btn btn-info", id: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
    
    
end