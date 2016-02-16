class PedidosController < ApplicationController
  def index
    @pedidos = Pedido.all
  end

  def show
    @pedido = Pedido.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PedidoPdf.new(@pedido)
        send_data pdf.render, filename: 'pedido.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  def new
    #@codigo = Pedido.buscar_numero
    @pedido = Pedido.new
    10.times do
      @pedido.enviarpedidos.build
    end
  end

  def create
    @pedido = Pedido.new(pedido_params)
    @pedido.codigo = Pedido.generar_folio
    if @pedido.save
      redirect_to @pedido
    else
      render 'new'
    end
  end

  def destroy
    @pedido = Pedido.find(params[:id])
    @pedido.destroy
    redirect_to pedidos_path
  end

  private
    def pedido_params
      params.require(:pedido).permit(:codigo, :departamento_id, :user_id, enviarpedidos_attributes: [:solicitado, :surtido, :articulo_id])
    end
end
