class Clients::PhoneNumbersController < ApplicationController
  def index
    @client = Client.find(params[:client_id])
    @phone_numbers = @client.phone_numbers
    @breadcrumbs = { Clients: clients_path, "#{@client.first_name} #{@client.last_name}": @client }
  end

  def edit
    @phone_number = PhoneNumber.find(params[:id])
    @path = client_phone_number_path(@phone_number.client, @phone_number)
    render partial: 'form', phone_number: @phone_number, path: @path
  end

  def show
    @phone_number = PhoneNumber.find(params[:id])
    render 'show', phone_number: @phone_number
  end

  def new
    @phone_number = Client.find(params[:client_id]).phone_numbers.build
    @path = client_phone_numbers_path(@phone_number.client)
    render partial: 'form', phone_number: @phone_number, path: @path
  end

  def create
    @client = Client.find(params[:client_id])
    @phone_number = @client.phone_numbers.build(phone_number_params)
    turbo_stream if @phone_number.save
  end

  def update
    @phone_number = PhoneNumber.find(params[:id])
    if @phone_number.update(phone_number_params)
      render partial: 'phone_number', locals: { phone_number: @phone_number }
    end
  end

  def destroy
    @phone_number = PhoneNumber.find(params[:id])
    if @phone_number.destroy
      turbo_stream
    end
  end

  private
  def phone_number_params
    params.require(:phone_number).permit(:number, :number_type)
  end
end
