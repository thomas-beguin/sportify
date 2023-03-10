class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :accept, :refuse]

  def index
    @user = User.find(params[:id])
    @bookings = policy_scope(Booking)
    @bookings = Booking.where(user_id: @user)
  end

  def show
    authorize @booking
    @product = @booking.product
    @markers = [{
      lat: @booking.product.latitude,
      lng: @booking.product.longitude,
      marker_html: render_to_string(partial: "marker", locals: { product: @product })
    }]
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @product = Product.find(params[:product_id])
    @booking.price = @product.price_per_day * (@booking.end_date - @booking.start_date) + @product.price_per_day
    if @booking.save
      redirect_to booking_path(@booking), status: :see_other
    else
      render "products/show", status: :unprocessable_entity
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    @booking.update(booking_params)
    redirect_to booking_path(@booking), status: :see_other
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path, status: :see_other
  end

  def accept
    authorize @booking
    @booking.accepted!
    redirect_to dashboard_path
  end

  def refuse
    authorize @booking
    @booking.refused!
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :product_id, :user_id, :price)
  end
end
