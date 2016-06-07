module ApplicationHelper
  def datepicker(form, name)
    form.input name, wrapper: :append do
      form.input_field(name, as: :string, class: 'datepicker') +
      content_tag('span', class: 'add-on') do
        content_tag 'i', '', class: 'icon-calendar'
      end
    end
  end
end
