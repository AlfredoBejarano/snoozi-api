class DogController < ApplicationController
  def sanitize(id)
    $id = id.to_i
    if $id.is_a? Integer
      return id
    else
      return 1
    end
  end

  def index
    render :json => Dog.all
  end

  def create
    @Dog = Dog.new(dog_params)

    respond_to do |format|
      if @Dog.save
        format.json { render json: @Dog, status: :created }
      else
        format.json { render json: @Dog.errors, status: :unprocessable_entity }
      end
    end
  end

  def show 
    $id = sanitize(params[:id])
    @Dog = Dog.find($id)
    render :json => @Dog
  end

  private

  def dog_params
    params.require(:dog).permit(:breed, :color, :gender, :found_location, :found_date, :description, :number, :image)
  end
end
