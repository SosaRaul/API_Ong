class AddContactFieldsToOrganizations < ActiveRecord::Migration[6.1]
  def change
    add_column :organizations, :linkedinUrl, :json
    add_column :organizations, :facebookUrl, :json
    add_column :organizations, :instagramUrl, :json
  end
end
