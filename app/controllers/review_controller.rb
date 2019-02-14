class ReviewController < ApplicationController

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def pull
    to_review = Conversation.find_by(reviewed: false).first
    to_review.reviewed = true
    to_review.save
    
  end

  def save_review
    if review_valid?
      Review.save
      flash[:notice] = "Review submitted"
    else
      flash[:notice] = "Not valid"
    end
  end

  def review_valid?
    true
  end

  def review_assigend

  end

end
