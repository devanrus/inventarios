class Departamento < ActiveRecord::Base
  has_many :pedidos
  validates :nombre, presence: { message: "Debe ingresar un nombre" }
  validates :titular, presence: {message: "Debe ingresar un Titular"}
end
