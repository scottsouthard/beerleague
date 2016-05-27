class MembershipsController < ApplicationController
  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new(membership_params)

    if @membership.save
      redirect_to :back
    else
      @errors = @membership.errors.full_messages
      render :new
    end
  end

  def destroy
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id, :team_id)
  end

end
