class Clients::FamilyMembersController < ApplicationController

  def index
    @client = Client.find(params[:client_id])
    @family_members = @client.family_members
    @breadcrumbs = { Clients: clients_path, "#{@client.first_name} #{@client.last_name}": @client }
  end

  def new
    @client = Client.find(params[:client_id])
    @family_member = @client.family_members.build
    @path = client_family_members_path(@client)
    render partial: 'form', family_member: @family_member, path: @path
  end

  def edit
    @client = Client.find(params[:client_id])
    @family_member = FamilyMember.find(params[:id])
    @path = client_family_member_path(@client, @family_member)
    render partial: 'form', family_member: @family_member, path: @path
  end

  def create
    @client = Client.find(params[:client_id])
    @family_member = @client.family_members.build(family_member_params)
    turbo_stream if @family_member.save
  end

  def update
    @family_member = FamilyMember.find(params[:id])
    if @family_member.update(family_member_params)
      render partial: 'family_member', locals: { family_member: @family_member }
    end
  end

  def destroy
    @family_member = FamilyMember.find(params[:id])
    if @family_member.destroy
      turbo_stream
    end
  end

  private
  def family_member_params
    params.require(:family_member).permit(:first_name, :last_name, :relationship, :address_1, :address_2, :city, :province, :postal_code, :date_of_birth, :income)
  end

end
