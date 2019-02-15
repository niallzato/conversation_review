module AdminHelper

  def intercom_admin_type?(author_id)
    author = Admin.find_by(id: author_id)
    return false if author.nil?
    author.author_type == "admin" || "bot"
  end

  def find_author(author_id)
    Admin.find(author_id)
  end

end
