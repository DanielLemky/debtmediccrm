class Clients::IdentificationsController < ApplicationController

  def index
    @client = Client.find(params[:client_id])
    @identifications = @client.identifications
    @breadcrumbs = { Clients: clients_path, "#{@client.first_name} #{@client.last_name}": @client }
  end

  def new
    @identification = Client.find(params[:client_id]).identifications.build
    @path = client_identifications_path(@identification.client)
    render partial: 'form', identification: @identification, path: @path
  end

  def edit
    @client = Client.find(params[:client_id])
    @identification = Identification.find(params[:id])
    @path = client_identification_path(@identification.client, @identification)
    render partial: 'form', identification: @identification, path: @path
  end

  def create
    @client = Client.find(params[:client_id])
    @identification = @client.identifications.build(identification_params)
    turbo_stream if @identification.save
  end

  def update
    @identification = Identification.find(params[:id])
    if @identification.update(identification_params)
      render partial: 'identification', locals: { identification: @identification }
    end
  end

  def destroy
    @identification = Identification.find(params[:id])
    if @identification.destroy
      turbo_stream
    end
  end

  private
  def identification_params
    params.require(:identification).permit(:id_type, :number, :expiry_date)
  end

end
