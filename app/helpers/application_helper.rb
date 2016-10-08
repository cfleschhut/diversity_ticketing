module ApplicationHelper
  def navbar_link_to(name, url)
    link_to_unless_current(name, url) {
      content_tag(:span, name, class: 'active')
    }
  end

  def span_for_funded(title, funded)
    content_tag(:span, title, class: funded ? 'funded' : 'not-funded')
  end

  def join_messages(messages)
    *head, tail = messages
    [head.join(", "), tail].reject { |s| s.blank? }.join(" and ")
  end

  def pluralize_highlight_count(count, word)

    output = Array.new
    output << "<span class='highlight'>#{count}</span>"

    if count != 0
      count == 1 ? output << "#{word}" : output << "#{word.pluralize}"
    end

    output.join(' ').html_safe
  end

  def format_date(date)
    date = Date.parse(date.to_s)
    date.strftime("%B #{date.mday.ordinalize}, %Y")
  end

  def format_date_range(start_date, end_date)
    start_date = Date.parse(start_date.to_s)
    end_date = Date.parse(end_date.to_s)

    if start_date.mon == end_date.mon
      start_date.strftime("%B #{start_date.mday.ordinalize}") + " to #{end_date.mday.ordinalize}, #{end_date.year}"
    else
      start_date.strftime("%B #{start_date.mday.ordinalize}") + " to " + end_date.strftime("%B #{end_date.mday.ordinalize}") + ", #{end_date.year}"
    end
  end
end
