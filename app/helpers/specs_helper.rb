module SpecsHelper

  def link_to_add_fields(name, f)
    new_object = { title: '', enabled: false }
    id = new_object.object_id
    fields = f.fields_for(new_object, child_index: id) do |builder|
      render(association.to_s + "custom_checks_field", f: builder)
    end
    link_to(name, '#', class: 'add_fields', data: {id: id, fields: fields.gsub("\n", "")})
  end
end
