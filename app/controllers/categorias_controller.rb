class CategoriasController < ApplicationController
  before_action :set_categoria, only: [:show, :edit, :update, :destroy]

  # GET /categorias
  def index
    @categorias = Categoria.all
  end

  # GET /categorias/1
  def show
  end

  # GET /categorias/new
  def new
    @categoria = Categoria.new
  end

  # GET /categorias/1/edit
  def edit
  end

  # POST /categorias
  def create
    @categoria = Categoria.new(categoria_params)
    if @categoria.save
      redirect_to categorias_path
    else
      render :new
    end
  end

  # PATCH/PUT /categorias/1
  def update
    if @categoria.update(categoria_params)
      redirect_to @categoria, notice: 'Categoria was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categorias/1
  def destroy
    @categoria.destroy
    redirect_to categorias_url, notice: 'Categoria was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoria
      @categoria = Categoria.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def categoria_params
      params.require(:categoria).permit(:nombre)
    end
end
