class EnviarpedidosController < ApplicationController

  def create
    @pedido = Pedido.new
    @pedid_articulo = @pedido.enviarpedidos.find(pedido_params)
    @pedido.save
  end

  private
    def pedido_params
      params.require(:enviarpedido).permit(:solicitado, :surtido, :departamento_id, :user_id)
      #code
    end

end
