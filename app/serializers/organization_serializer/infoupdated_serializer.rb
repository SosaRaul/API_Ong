module OrganizationSerializer
    class InfoupdatedSerializer < ActiveModel::Serializer
        attributes :name,:address,:phone,:email,:aboutUsText,:welcomeText,:facebookUrl, :instagramUrl, :linkedinUrl
    end    
end    