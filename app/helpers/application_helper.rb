module ApplicationHelper
  def active?(path)
  	"active" if current_page?(path)
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
        success: "fa-check-circle-o",
        error: "fa-check-circle-o",
        alert: "fa-exclamation-triangle",
        notice: "fa-info-circle"
    }[flash_type.to_sym] || 'glyphicon-screenshot'
  end

end
