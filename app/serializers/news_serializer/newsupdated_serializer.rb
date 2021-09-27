module NewsSerializer
    class NewsupdatedSerializer < ActiveModel::Serializer
        attributes :name,:content
    end 
end         