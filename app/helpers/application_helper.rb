module ApplicationHelper
  def nbsp(opt={})
    _str = ''
    _str += ", " if opt[:comma]
    _str += "&nbsp;"
    _str += "&nbsp;"*(opt[:repeat]-1) if opt[:repeat] and opt[:repeat] > 1
    _str.html_safe
  end
end
