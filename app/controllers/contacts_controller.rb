class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  # GET /contacts
  def index
    @contacts = Contact.all
    render json: @contacts, include: [:kind, :phones, :address]
#    render json: @contacts, methods: :birthdate_br, include: [:kind, :phones, :address]
#    render json: @contacts, include: {kind: { only: :description }}
#    render json: @contacts, methods: [:kind_description]
#    render json: @contacts# , root: true, only: [:name,:email]
#    render json: @contacts.map{|contact| contact.attributes.merge({autor: "Lúcio"})}, only: [:name,:autor]
  end

  # GET /contacts/1
  def show
    render json: @contact, include: [:kind, :phones, :address]
#    render json: @contact, include: {kind: { only: :description }}
#    @contact = @contact.attributes.merge({autor: @contact.name})
#    render json: @contact, methods: :author, only: [:name,:author]
  end

  # POST /contacts
  def create

    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, include: [:kind, :phones, :address], status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact, include: [:kind]
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

    # Only allow a trusted parameter "white list" through.
    def contact_params
#      params.require(:contact).permit(
#        :name, :email, :birthdate, :kind_id,
#        phones_attributes: [:id, :number, :_destroy],
#        address_attributes: [:id, :street, :city]
#      )
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end

end
