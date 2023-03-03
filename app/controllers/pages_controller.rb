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
    # CLIENT PART
    @current_rent = current_user.bookings.select { |booking| booking.end_date >= Date.today && !booking.refused? }
    @previous_rent = current_user.bookings.select { |booking| booking.end_date < Date.today || booking.refused? }
    @previous_rent.each { |booking| booking.passed! }

    # OWNER PART
    @products = current_user.products
    @bookings = @products.map(&:bookings).flatten
    @bookings.each { |booking| booking.passed! if booking.end_date < Date.today }

    @bookings_accepted = @bookings.select(&:accepted?)
    @bookings_passed = @bookings.select(&:passed?)
    @bookings_pending = @bookings.select(&:pending?)

    @products_rent = current_user.products.select { |product| product.bookings.select { |booking| booking.accepted? } }
  end
end
