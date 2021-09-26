module OrganizationSerializer 
  class PublicinfoSerializer < ActiveModel::Serializer
    attributes :name,:address,:phone,:image_url
  end  
end
