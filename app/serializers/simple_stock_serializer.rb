class SimpleStockSerializer < ActiveModel::Serializer
  attributes :company_name, :price
end
