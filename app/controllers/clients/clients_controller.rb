class Clients::ClientsController < ApplicationController
  def index
    @clients = Client.all
    @breadcrumbs = { Clients: nil }
  end

  def show
    @client = Client.find(params[:id])
    @breadcrumbs = { Clients: clients_path, "Client Details": nil }
  end

  def edit
    @client = Client.find(params[:id])
    render partial: "#{params[:field]}_field", client: @client
  end

  def update
    @client = Client.find(params[:id])
    @client.update(client_params)
    render partial: params[:client][:field], client: @client
  end

  private
  def client_params
    params.require(:client).permit(:first_name, :last_name, :middle_initial, :email, :date_of_birth, :gender, :marital_status, :family_size)
  end
end
