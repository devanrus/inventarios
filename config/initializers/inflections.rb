ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'pedido', 'pedidos'
  inflect.irregular 'categoria', 'categorias'
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
end
