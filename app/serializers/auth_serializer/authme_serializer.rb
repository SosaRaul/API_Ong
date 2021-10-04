module AuthSerializer
    class  AuthmeSerializer < ActiveModel::Serializer
      attributes :id,
                 :firstName,
                 :lastName,
                 :email,
                 :photo,
                 :role_id
    end
  end