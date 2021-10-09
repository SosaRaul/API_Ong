class ContactsController < ApplicationController
 before_action :authorize_request, only: [:index,:show, :update,:destroy, :create]

  # GET /contacts
  def index
    @contacts = Contact.all
    #Habra conflicto porque agregue el serializer
    render json: @contacts, each_serializer: ContactsSerializer::ContactinfoSerializer
  end

  # GET /contacts/1
  def show
    render json: @contact
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)
    @contact.user = @current_user
    #@contact.user = @user.id

    if @contact.save
      render json: @contact, status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

     private

  def find_user  
    if(params[:id].to_i == @current_user.id)
      @user = User.find(@current_user.id)
     #rescue ActiveRecord::RecordNotFound
  #  elsif (User.find_by("id": params[:id]) ).nil?
  #    render status: :not_found
    else
      render json: {message: "No permitted"}, status: :forbidden
    end
  end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:name, :phone, :email, :message, :user_id, :current_user)
    end
end
