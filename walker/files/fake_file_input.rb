class FakeFileInput < SimpleForm::Inputs::StringInput
  def input
    # TODO: perhaps set an attr_accessor on object instance
    # TODO: perhaps set a hidden field called retained_#{attribute_name}
    value = object.try(attribute_name).try(:name)
    template.content_tag(:div, class: 'fileinputs') do
      html = ''
      html << @builder.input_field(attribute_name, as: :file)
      html << template.content_tag(:div, class: 'fakefile') do
        template.content_tag(:div, class: 'input-append') do          
          @builder.input_field(:fake_file, {value: value}) +
          template.content_tag(:span, class: 'add-on') do
            "<i class=\"icon-file\"></i>".html_safe
          end
        end
      end
      html.html_safe
    end
  end
end
