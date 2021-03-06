# frozen_string_literal: true

module DashboardHelper
  def category_tree(category)
    html = ""
    return html unless category

    html << link_to('Todas categorias', authenticated_root_path) << ' -> ' unless category.ancestors?
    category.path.each do |child|
      html += link_to(child.name, authenticated_root_path(category_id: child.id))
      html += ' -> ' unless child == category
    end
    html.html_safe
  end
end
