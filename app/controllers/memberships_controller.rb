class MembershipsController < ApplicationController
	def index
    @memberships = Membership.all
    @people = Person.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @memberships }
    end
  end

  # def show
  #   @membership = Membership.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @membership }
  #   end
  # end

  def new
    @membership = Membership.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @membership }
    end
  end

  def edit
    @membership = Membership.find(params[:id])
  end

  def create
    @membership = Membership.new(params[:membership])

    respond_to do |format|
      if @membership.save
        format.html { redirect_to group_url(@membership.group_id), notice: 'Membership was successfully created.' }
        format.json { render json: memberships_url, status: :created, location: @person }
      else
        format.html { render action: "new" }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @membership = Membership.find(params[:id])

    respond_to do |format|
      if @membership.update_attributes(params[:person])
        format.html { redirect_to @membership, notice: 'Membership was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy

    respond_to do |format|
      format.html { redirect_to memberships_url }
      format.json { head :no_content }
    end
  end
end
