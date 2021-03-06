class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(work_id: params[:vote][:work_id], date: Date.today, user_id: session[:logged_in_user])
    if @vote.save
      flash[:status]= :success
    else
      flash[:status] = :failure
      flash[:message] = "Could not upvote"
      flash[:details] = @vote.errors.messages
      redirect_to works_path
    end
  end

end
