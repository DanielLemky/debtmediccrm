class ClientsController < ApplicationController

  def index
    @clients = Client.all
    @breadcrumbs = { Clients: nil }
  end

  def show
    @client = Client.find(params[:id])
    @breadcrumbs = { Clients: clients_path, "Client Details": nil }
  end
end
