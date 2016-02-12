class ArticulosPdf < Prawn::Document
  def initialize(articulos)
    super()
    @articulos = articulos
    header
    body
  end

  def header
    image "#{Rails.root}/app/assets/images/logo-header.png", width: 540, height: 75, :at => [0, 740]
    draw_text "Dirección de Recursos Materiales", :at => [185,660]
  end

  def body
    move_down 90
    table_content
  end

  def table_content
    table articulos_rows do
      row(0).font_style = :bold
      row(0).background_color = 'dbdee2'
      self.cell_style = {size: 9, border_color: 'd6d8db'}
      self.column_widths = [60, 300, 100]
    end
  end

  def articulos_rows
    [ [{:content => "Total de Artículos en Inventario", :colspan =>3}],
      ['Código', 'Descripción', 'Disponible'] ] +
      @articulos.map do |articulo|
      [articulo.codigo, articulo.descripcion, articulo.existencia.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse]
    end
  end

end
