class StockSerializer < ActiveModel::Serializer
  attributes :id, :company_name
  has_many :shares
end
