class Enviarpedido < ActiveRecord::Base
  belongs_to :articulo
  belongs_to :pedido

  validates :surtido, presence: { message: "Ingrese la cantidad que se esta enviado(surtido)" }
  validates :solicitado, presence: { message: "Ingrese la cantidad solicitada" }
  validate :articulo_valido

  after_save :quitar_del_inventario
  after_destroy :regresar_al_inventario

  private
    def articulo_valido
      unless Articulo.exists?(self.articulo_id)
        errors.add(:msg, "El código #{self.articulo_id} no existe")
      end
    end

    def quitar_del_inventario
      articulo.existencia -= self.surtido
      articulo.save
    end

    def regresar_al_inventario
      articulo.existencia += self.surtido
      articulo.save
    end

    def self.demanda_articulos
      Enviarpedido.group(:articulo_id).order('count(*) desc').limit(7).count
    end
end
