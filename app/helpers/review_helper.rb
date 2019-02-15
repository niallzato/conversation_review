module ReviewHelper

  def conversation_render_side(author_id)
    if intercom_admin?(author_id)
      "left"
    else
      "right"
    end
  end

  def intercom_admin?(author_id)
    intercom_admin_type?(author_id) == true
  end

end
