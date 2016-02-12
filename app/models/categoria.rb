class Categoria < ActiveRecord::Base
  has_many :articulos
end
