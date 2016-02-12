class ArticulosController < ApplicationController
  before_action :set_articulo, only: [:show]

  def index
    @articulos = Articulo.all.order(existencia: :asc)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ArticulosPdf.new(@articulos)
        send_data pdf.render, filename: 'articulos.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  def show
  end

  def new
    @articulo = Articulo.new
  end

  def create
    @articulo = Articulo.new(articulo_params)
    if @articulo.save
      redirect_to articulos_path
    else
      render 'new'
    end
  end

  def edit
    @articulo = Articulo.find(params[:id])
  end

  def update
    @articulo = Articulo.find(params[:id])
    if @articulo.update(articulo_params)
      redirect_to @articulo
    else
      render 'edit'
    end
  end

  def destroy
    @articulo = Articulo.find(params[:id])
    @articulo.destroy
    redirect_to articulos_path
  end

  private
    def set_articulo
      @articulo = Articulo.find(params[:id])
    end

    def articulo_params
      params.require(:articulo).permit(:codigo, :descripcion, :existencia, :categoria_id)
    end

end
