class Pedido < ActiveRecord::Base
  has_many :enviarpedidos, dependent: :destroy
  has_many :articulos, through: :enviarpedidos
  belongs_to :departamento
  belongs_to :user

  validates :departamento_id, presence: { message: "Debe seleccionar un Titular" }

  accepts_nested_attributes_for :enviarpedidos, :reject_if => lambda { |c| c[:articulo_id].blank?}

  private
    def self.generar_folio
      time, numero_random = Time.new, Random.new
      orden = time.strftime("%Y%m%d") + "#{numero_random.rand(100)}"
      if Pedido.exists?(codigo: orden)
        generar_folio
      else
        orden
      end
    end

    def self.articulos_pedido(pedido_id)
      Pedido.select('pedidos.id,
                     articulos.codigo, articulos.descripcion,
                     enviarpedidos.surtido, enviarpedidos.solicitado')
            .joins(:articulos)
            .where(:pedidos => {:id => pedido_id})
    end

    def self.detalles_pedido(pedido_id)
      Pedido.select('pedidos.*,
                    departamentos.titular, departamentos.nombre,
                    users.nombre as nomuser, users.apellidos')
            .joins(:departamento, :user).find(pedido_id)
    end

    def self.recientes
      Pedido.select('departamentos.titular,
                    pedidos.codigo, pedidos.id as pedido_id, pedidos.created_at')
            .joins(:departamento)
            .order("created_at DESC")
            .limit(9)

    end
end
