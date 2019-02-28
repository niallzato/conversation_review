class AdminController < ApplicationController

  def index
    @admins = Admin.all
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def reviews_by_admin
    admin = Admin.find(params[:id])
    @reviews = Review.joins(:conversation).where(reviewed: true, conversations: {admin_id: admin.intercom_id})
  end

  def reviewed_by_admin
    admin = Admin.find(params[:id])
    @reviews = Review.joins(:conversation).where(reviewed: true, conversations: {admin_id: admin.intercom_id})
  end
end
