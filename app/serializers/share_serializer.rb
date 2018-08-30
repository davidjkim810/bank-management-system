class ShareSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :price
  belongs_to :user
  belongs_to :stock
end
