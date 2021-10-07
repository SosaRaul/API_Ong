module OrganizationSerializer 
  class PublicinfoSerializer < ActiveModel::Serializer
    attributes :name,:address,:phone,:image_url,:linkedinUrl,:facebookUrl,:instagramUrl
  end  
end
