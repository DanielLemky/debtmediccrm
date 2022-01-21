class Clients::PhoneNumbersController < ApplicationController
  def index
    @client = Client.find(params[:client_id])
    @phone_numbers = @client.phone_numbers
    @breadcrumbs = { Clients: clients_path, PhoneNumbers: nil }
  end
  def edit
    @phone_number = PhoneNumber.find(params[:id])
    render 'clients/phone_numbers/edit'
  end
end
