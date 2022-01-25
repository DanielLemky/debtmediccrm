class Clients::EmploymentsController < ApplicationController

  def index
    @client = Client.find(params[:client_id])
    @employments = @client.employments
    @breadcrumbs = { Clients: clients_path, "#{@client.first_name} #{@client.last_name}": @client }
  end

  def new
    @client = Client.find(params[:client_id])
    @employment = @client.employments.build
    @path = client_employments_path(@client)
    render partial: 'form', employment: @employment, path: @path
  end

  def edit
    @client = Client.find(params[:client_id])
    @employment = Employment.find(params[:id])
    @path = client_employment_path(@client, @employment)
    render partial: 'form', employment: @employment, path: @path
  end

  def create
    @client = Client.find(params[:client_id])
    @employment = @client.employments.build(employment_params)
    turbo_stream if @employment.save
  end

  def update
    @employment = Employment.find(params[:id])
    if @employment.update(employment_params)
      render partial: 'employment', locals: { employment: @employment }
    end
  end

  def destroy
    @employment = Employment.find(params[:id])
    if @employment.destroy
      turbo_stream
    end
  end

  private
  def employment_params
    params.require(:employment).permit(:employer, :employment_type, :address_1, :address_2, :city, :province, :position, :start_date, :end_date, :current)
  end

end
