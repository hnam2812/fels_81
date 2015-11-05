module ApplicationHelper
  def new_fields_template f, association
    new_object = f.object.class.reflect_on_association(association).klass.new
    tmpl = f.fields_for(association, new_object,
      child_index: "new_#{association}") do |b|
      render(partial: association.to_s.singularize + "_form", locals: {f: b})
    end
    tmpl = tmpl.gsub /(?<!\n)\n(?!\n)/, " "
    return "<script> var #{association.to_s}_form = '#{tmpl.to_s}' </script>"
      .html_safe
  end

  def add_child_button name, association, target
    content_tag(:spam, "<span class='btn btn-success'>#{name}</span>".html_safe,
      class: "add_child", "data-association"=> association, target: target)
  end
end
