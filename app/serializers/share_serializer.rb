class ShareSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :price
  belongs_to :stock, serializer: SimpleStockSerializer
end
