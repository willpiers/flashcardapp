class MembershipsController < ApplicationController

  def create
    @membership = Membership.new(params[:membership])

    respond_to do |format|
      if @membership.save
        format.html { redirect_to group_url(@membership.group_id), notice: 'Membership was successfully created.' }
        format.json { render json: memberships_url, status: :created, location: @person }
      else
        format.html { redirect_to groups_url, alert: "That person could not be added to that group" }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy

    respond_to do |format|
      format.html { redirect_to person_url(@membership.person_id) }
      format.json { head :no_content }
    end
  end
end
