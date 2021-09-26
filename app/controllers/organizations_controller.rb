class OrganizationsController < ApplicationController
  before_action :authorize_request, only: [:update,:destroy,:create]
  before_action :verify_user_is_admin, only: [:update, :destroy,:create]
  before_action :set_organization, only: [:update, :destroy]
  
  # GET /organizations
  def index
    @organizations = Organization.all

    render json: @organizations
  end

  # GET /organization/public
  def show
    @organization = Organization.first
    render json: @organization ,serializer: OrganizationSerializer::PublicinfoSerializer
  end

  # POST /organizations
  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      render json: @organization, status: :created, location: @organization
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /organizations/1
  def update
    if @organization.update(organization_params)
      render json: @organization, serializer: OrganizationSerializer::InfoupdatedSerializer
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  # DELETE /organizations/1
  def destroy
    @organization.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.first
    end

    # Only allow a list of trusted parameters through.
    def organization_params
      params.permit(:name,:phone,:email,:address,:aboutUsText,:welcomeText,:linkedinUrl,:facebookUrl,:instagramUrl)
    end
end
