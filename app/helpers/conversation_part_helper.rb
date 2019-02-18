module ConversationPartHelper

  def content_render(part)
    content = part.body.blank? && simple_part?(part) ? render_simple_part(part) : part.body
    return part.part_type if content.blank?
    content
  end

  def render_simple_part(part)
    return participant_added_text if participant_added?(part)
    return participant_removed_text if participant_removed?(part)
    return assignment_text if assignment?(part)
    return snoozed_text if snoozed?(part)
    return unsnoozed_text if unsnoozed?(part)
    return closed_text if closed?(part)
    return opened_text if opened?(part)
    return qualification_text if intercom_qualification?(part)
  end

  def render_image(part)

  end

  def qualification_text
    'Qualification'
  end

  def participant_added_text
    'Participant Added'
  end

  def participant_removed_text
    'Participant Removed'
  end

  def assignment_text
    'Assignment'
  end

  def snoozed_text
    'snoozed'
  end

  def unsnoozed_text
    'unsnoozed'
  end

  def closed_text
    'closed'
  end

  def opened_text
    'opened'
  end

  def simple_part?(part)
    participant_added?(part) || participant_removed?(part) || snoozed?(part) ||  unsnoozed?(part) ||  assignment?(part) ||  closed?(part) || opened?(part) || intercom_qualification?(part)
  end

  def participant_added?(part)
    part.part_type == 'participant_added'
  end

  def participant_removed?(part)
    part.part_type == 'participant_removed'
  end

  def snoozed?(part)
    part.part_type == 'snoozed'
  end

  def unsnoozed?(part)
    part.part_type == 'unsnoozed'
  end

  def assignment?(part)
    part.part_type == 'assignment'
  end

  def closed?(part)
    part.part_type == 'close'
  end

  def opened?(part)
    part.part_type == 'open'
  end

  def intercom_qualification?(part)
    part.part_type == 'comment' && part.author_type == 'bot'
  end

end
