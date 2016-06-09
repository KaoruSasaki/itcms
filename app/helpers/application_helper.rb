module ApplicationHelper
  def datepicker(form, name)
    form.input name, wrapper: :append do
      form.input_field(name, as: :string, class: 'datepicker') +
      content_tag('span', class: 'add-on') do
        content_tag 'i', '', class: 'icon-calendar'
      end
    end
  end

  def content_type_name(name)
    name == "IticketContent" ? "アイチケット" : "医療機関"
  end

  def range_date(start_date,end_date)
    "#{DateTime.parse(start_date).strftime('%Y/%m/%d')} ～ #{DateTime.parse(end_date).strftime('%Y/%m/%d')}"
  end

  def display_date(date)
    if date.class == ActiveSupport::TimeWithZone
      date.strftime('%Y/%m/%d')
    elsif /^\d{8}/=~ date
      DateTime.parse(date).strftime('%Y/%m/%d')
    else
      date
    end
  end

  def enabled_name(b)
    b ? "有効" : "無効"
  end
end
