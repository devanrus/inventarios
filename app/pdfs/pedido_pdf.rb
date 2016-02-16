class PedidoPdf < Prawn::Document
  def initialize(pedido)
    super()
    @pedido = pedido
    @codigo_pedido = @pedido.codigo.to_s
    header
    body
    footer
  end

  def header
    image "#{Rails.root}/app/assets/images/logo-header.png", width: 540, height: 75, :at => [0, 740]
    draw_text "Dirección de Recursos Materiales", :at => [185,660]
  end

  def body
    move_down 90
    table_content
  end

  def footer
    draw_text @pedido.user.nombre + " " + @pedido.user.apellidos, :at => [25, 28]
    draw_text "_________________________________", :at => [10, 25]
    draw_text "Elaboró y Autorizó", :at => [32, 12]

    draw_text @pedido.departamento.titular, :at => [350, 28]
    draw_text "_________________________________", :at => [310, 25]
    draw_text "Firma del Responsable", :at => [370, 12]
  end

  def table_content
    table articulos_rows do
      row(0).font_style = :bold
      row(0).background_color = 'dbdee2'
      row(2).font_style = :bold
      row(2).background_color = 'dbdee2'
      row(4).font_style = :bold
      row(4).background_color = 'dbdee2'
      self.header = true
      self.cell_style = {size: 10, border_color: 'd6d8db'}
      self.column_widths = [60, 300, 90, 90]
    end
  end

  def articulos_rows
    [ [{:content => "Titular", :colspan =>2}, {:content => "Número de Orden", :colspan => 2}],
      [{:content => @pedido.departamento.titular, :colspan => 2}, {:content => @codigo_pedido, :colspan => 2}],
      [{:content => "Departamento", :colspan =>2}, {:content => "Fecha", :colspan => 2}],
      [{:content => @pedido.departamento.nombre, :colspan => 2}, {:content => @pedido.created_at.strftime("%d/%m/%Y"), :colspan => 2}],
      [{:content => "Articulos Solicitados", :colspan => 4}],
      ['Código', 'Descripción', 'Solicitado', 'Surtido'] ] +
      @pedido.enviarpedidos.map do |detalles_pedido|
      [detalles_pedido.articulo.codigo, detalles_pedido.articulo.descripcion, detalles_pedido.solicitado.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse, detalles_pedido.surtido.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse]
    end
  end
end
