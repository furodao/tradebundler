module TableHelper

  def row_class_from_status(status)
    case status
    when 'pending' then 'warning'
    when 'accepted' then 'success'
    when 'rejected' then 'danger'
    end
  end
end
