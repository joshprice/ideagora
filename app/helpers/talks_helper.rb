module TalksHelper
  def casual_day_description(date)
    today = Time.now.to_date
    day_diff = date - today
    if day_diff < 0 
      case day_diff.abs
        when 0..1 then 'Yesterday'
        else "#{date.to_time.strftime("%A, %d %B, %Y")}"
      end
    else
      case day_diff
        when 0...1 then 'Today'
        when 1...2 then 'Tomorrow'
        when 2...7 then "This #{date.to_time.strftime("%A")}"
        else "#{date.to_time.strftime("%A, %d %B, %Y")}"
      end
    end
  end
  
  def mini_day_description(date)
    date.to_time.strftime('%A')
  end

  def talk_description(talk)
    html = <<-END
      #{talk.try(:name)} <br/>
      #{talk.try(:user).try(:full_name)}
    END
    html.html_safe
  end
end
