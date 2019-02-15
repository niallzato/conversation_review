class ReviewController < ApplicationController

  def index
    @review = reviewing
    binding.pry
  end

  def show
    @review = Review.find(params[:id])
  end

  def pull
    to_review = Conversation.where(reviewed: false).first
    to_review.reviewed = true
    to_review.save
    review = Review.create(conversation_id: to_review.id, reviewed: false, assigned: 76)
    review.save
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

  def assigned_review
    Review.where(assigned: 76, reviewed: false).first
  end

  def reviewing
    return assigned_review unless assigned_review.blank?
    pull
  end

end
