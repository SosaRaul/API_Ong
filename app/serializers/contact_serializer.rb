class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :email, :message
  has_one :user
end
