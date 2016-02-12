class Articulo < ActiveRecord::Base
  has_many :enviarpedidos
  has_many :pedidos, through: :enviarpedidos
  belongs_to :categoria

  validates :codigo, presence: { message: "Debe ingresar un código" }
  validates :descripcion, presence: { message: "Debe ingresar una descripción" }
  validates :existencia, presence: { message: "Debe ingresar una cantidad disponible" }

  def descripcion=(value)
    write_attribute(:descripcion, value.mb_chars.upcase)
  end

  private
    def self.disponibilidad(status)
      if status == "disponible"
        Articulo.where("existencia > ?", 0).count
      elsif status == "agotado"
        Articulo.where("existencia <= ?", 0).count
      end
    end
end
