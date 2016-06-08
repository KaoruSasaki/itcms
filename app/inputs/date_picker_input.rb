class DatePickerInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    set_html_options
    set_value_html_option

    template.content_tag :div, class: 'input-group date datetimepicker' do
      input = super(wrapper_options) # leave StringInput do the real rendering
      input + input_button
    end
  end

  def input_html_classes
    super.push ''   # 'form-control'
  end

  private

  def input_button
    template.content_tag :span, class: 'input-group-btn' do
      template.content_tag :button, class: 'btn btn-default', type: 'button' do
        template.content_tag :span, '', class: 'fa fa-calendar'
      end
    end
  end

  def set_html_options
    input_html_options[:type] = 'text'
    input_html_options[:data] ||= {}
    input_html_options[:data].merge!(date_options: date_options)
  end

  def set_value_html_option
    return unless value.present?
    input_html_options[:value] ||= I18n.localize(string_to_datetime(value), format: display_pattern)
  end
  
  def string_to_datetime(value)
    value = value.gsub('/','')
    if /^\d{8}$/ =~ value
      DateTime.new(value[0..3].to_i, value[4..5].to_i, value[6..7].to_i, 0, 0, 0)
    else
      ""
    end
  end

  def value
    object.send(attribute_name) if object.respond_to? attribute_name
  end

  def display_pattern
    I18n.t('datepicker.dformat', default: '%Y/%m/%d')
  end

  def picker_pattern
    I18n.t('datepicker.pformat', default: 'YYYY/MM/DD')
  end

  def date_view_header_format
    I18n.t('dayViewHeaderFormat', default: 'YYYY MMMM')
  end

  def date_options_base
    {
        locale: I18n.locale.to_s,
        format: picker_pattern,
        dayViewHeaderFormat: date_view_header_format
    }
  end

  def date_options
    custom_options = input_html_options[:data][:date_options] || {}
    date_options_base.merge!(custom_options)
  end

end
