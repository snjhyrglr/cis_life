module ApplicationHelper
  include Pagy::Frontend
  
  def to_currency(amount)
    number_to_currency(amount, locale: :ph)
  end

  def num_delimit(num)
    number_with_delimiter(num)
  end

  def to_percent(num)
    number_to_percentage(num, precision: 0)
  end

  def contestable_age(min, max)
    min == 0 && max == 0 ? "" : "(#{min} to #{max} years old)"
  end

  def contestable_period(period, type)
    period <= 0 ? "Waived Contestability" : "#{pluralize(sprintf('%g', period), type)}"
  end

  def nel_nml(amount)
    amount == 0 ? "None" : "#{to_currency(amount)}"
  end

  def plan_bg(id)
    case id
    when 1 then "bg-primary px-2" # LPPI
    when 2 then "bg-warning px-2" # GYRT
    when 3 then "bg-success px-2" # YES
    when 4 then "bg-danger px-2" # SII
    when 5 then "bg-info px-2" # GBLISS
    end
  end

  def health_dec_answer(val)
    puts "#{val}---->"
    case val 
    when "true" then bootstrap_icon('check-circle-fill', fill: "green")
    when "false" then bootstrap_icon('x-circle-fill', fill: "gray")
    else
      val
    end
  end

  def insurance_status(val)
    case val
    when "Pending" then content_tag(:span, val, class: "lead text-secondary")
    when "Approved" then content_tag(:span, val, class: "lead text-success")
    when "Denied" then content_tag(:span, val, class: "lead text-danger")
    end
  end

  
end
