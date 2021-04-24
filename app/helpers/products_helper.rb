module ProductsHelper
  def sort_order(column, name)
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to name, { sort: column, direction: direction }, class: "sort_header #{css_class}"
  end
end