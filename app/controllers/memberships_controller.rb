class MembershipsController < ApplicationController

  def create
    @membership = Membership.new(params[:membership])

    respond_to do |format|
      if @membership.save
        flash[:success] = 'Membership was successfully created.'
        format.html { redirect_to group_url(@membership.group_id) }
        format.json { render json: memberships_url, status: :created, location: @person }
      else
        flash[:error] = "#{@membership.person.name} could not be added to #{@membership.group.name}"
        format.html { redirect_to groups_url }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy
    flash[:success] = "#{@membership.person.name} has been removed from #{@membership.group.name}"
    respond_to do |format|
      format.html { redirect_to person_url(@membership.person_id) }
      format.json { head :no_content }
    end
  end
end
