class DatetimePickerInput < DatePickerInput
  private

  def display_pattern
    I18n.t('datepicker.dformat', default: '%Y/%m/%d') + ' ' +
        I18n.t('timepicker.dformat', default: '%X')
  end

  def picker_pattern
    I18n.t('datepicker.pformat', default: 'YYYY/MM/DD') + ' ' +
        I18n.t('timepicker.pformat', default: 'YYYY/MM/DD')
  end
end
