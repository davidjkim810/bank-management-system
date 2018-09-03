class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :type_of_transaction, :amount, :processed

end
