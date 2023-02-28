class PagesController < ApplicationController
  def home
  end

  def terms
  end

  def sitemap
  end

  def privacy
  end

  def faq
  end

  def show
    @current_rent = current_user.bookings.select { |booking| booking.start_date <= Date.today && booking.end_date >= Date.today }
    @previous_rent = current_user.bookings.select { |booking| booking.end_date < Date.today }
    @products = current_user.products
  end
end
