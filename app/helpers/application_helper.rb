module ApplicationHelper

  def programmeleader?
    admin_types.include?(current_user.type) 
  end

  def programmeleader_or_lecturer?
    staff.include?(current_user.type)
  end

  def lecturer?
    lecturer.include?(current_user.type)
  end

  def student?
    user_types.include?(current_user.type) 
  end

  def student_dashboard_action?(record)
    user_creator_and_not_approve(record) || programmeleader?
  end

  def user_creator_and_not_approve(record)
    user_creator(record) && !post_approved?(record)
  end

  def active?(path)
  	"active" if current_page?(path)
  end

  def bootstrap_class_for(flash_type)
    {
        success: "alert-success",
        error: "alert-error",
        alert: "alert-danger",
        notice: "alert-info"
    }[flash_type.to_sym] || flash_type.to_s
  end

  def bootstrap_glyphs_icon(flash_type)
    {
        success: "",
        error: "",
        alert: "",
        notice: "fa-info-circle"
    }[flash_type.to_sym] || 'glyphicon-screenshot'
  end

  private

  def admin_types
    ['ProgrammeLeader']
  end

  def staff
    ['ProgrammeLeader','Lecturer']
  end

  def lecturer
    ['Lecturer']
  end

  def user_types
    ['Student']
  end

  def user_creator(record)
    record.user_id == current_user.id
  end

  def post_approved?(record)
    record.approved?
  end

end
