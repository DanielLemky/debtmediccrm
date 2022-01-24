class Clients::AddressesController < ApplicationController

  def index
    @client = Client.find(params[:client_id])
    @addresses = @client.addresses.order(:address_type)
    @breadcrumbs = { Clients: clients_path, "#{@client.first_name} #{@client.last_name}": @client }
  end

  def new
    @address = Client.find(params[:client_id]).addresses.build
    render 'new', address: @address
  end

  def edit
    @address = Address.find(params[:id])
    render 'edit', address: @address
  end

  def create
    @client = Client.find(params[:client_id])
    @address = @client.addresses.build(address_params)
    if params[:current_address]
      @address.address_type = :current
    else
      @address.address_type = :past
    end
    turbo_stream if @address.save
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      render partial: 'address', locals: { address: @address }
    end
  end

  def destroy
    @address = Address.find(params[:id])
    if @address.destroy
      turbo_stream
    end
  end

  private
  def address_params
    params.require(:address).permit(:address_1, :address_2, :city, :province, :postal_code, :address_type, :current_address)
  end

end
