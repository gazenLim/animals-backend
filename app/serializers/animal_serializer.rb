class AnimalSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :image, :description, :category_id
  belongs_to :category
end
