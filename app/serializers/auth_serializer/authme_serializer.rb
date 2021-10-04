module AuthSerializer
    class  AuthmeSerializer < ActiveModel::Serializer
      attributes :firstName,
                 :lastName,
                 :email,
                 :photo          
    end
  end