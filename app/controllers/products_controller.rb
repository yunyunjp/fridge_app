class ProductsController < ApplicationController
  before_action :search_product, only: [:index, :search]

  helper_method :sort_column, :sort_direction

  def index
    @products = Product.order("#{sort_column} #{sort_direction}")
    set_product_column
    set_category_column
  end

  def search
    @results = @p.result.includes(:category)
  end

  private

  def search_product
    @p = Product.ransack(params[:q])
  end

  def set_product_column
    @product_name = Product.select('name').distinct
    @product_shelf_life = Product.select('shelf_life').distinct
    @product_frozen_life = Product.select('frozen_life').distinct
  end

  def set_category_column
    @category_name = Category.select('name').distinct
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : 'name'
  end
end
