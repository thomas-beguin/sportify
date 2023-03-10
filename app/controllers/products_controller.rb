class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = policy_scope(Product)
    @markers = @products.geocoded.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {product: product}),
        marker_html: render_to_string(partial: "marker", locals: {product: product}) # Pass the product to the partial
      }
    end

    if params[:query].present?
      @products = Product.search_by_name_and_category_and_sport(params[:query])
    end

    if params[:current_position].present?
      @products = Product.near([params[:current_position][:lat], params[:current_position][:lon]], 10)
    end

  end

  def show
    authorize @product
    @booking = Booking.new
    @markers = [{
      lat: @product.latitude,
      lng: @product.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: {product: @product}),
      marker_html: render_to_string(partial: "marker", locals: {product: @product})
    }]
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    authorize @product
    if @product.save
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @product
  end

  def update
    authorize @product
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @product
    @product.destroy
    redirect_to products_path, status: :see_other
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :category, :price_per_day, :year_of_purchase, :condition, photos: [])
  end
end
