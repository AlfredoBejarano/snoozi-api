require "base64"

class DogsController < ApplicationController
  include ActionController::MimeResponds

  def sanitize(id)
    $id = id.to_i
    if $id.is_a? Integer
      return id
    else
      return 1
    end
  end

  def index
    @dogs = Dog.all
    render json: @dogs.as_json(
      :only => [
        :id,
        :breed,
        :color,
        :image,
        :found_location
      ]
    )
  end

  def create
    sanitize_params = dog_params.delete :id
    @Dog = Dog.new(sanitize_params)
    if @Dog.save
      render json: @Dog, status: 200
    else
      render json: {errors: @Dog.errors}, status: 422
    end
  end

  def show 
    $id = sanitize(params[:id])
    if(Dog.exists?($id))
      @Dog = Dog.find($id)
      render json: @Dog.as_json(
        :only => [
          :id,
          :breed,
          :color,        
          :description,
          :found_date,
          :found_location,
          :image,
          :number
        ]
      )
    else
      render json: { "code":"404" }
    end
  end

  private
  
  def dog_params
    params.require(:dog).permit(:breed, :color, :found_location, :found_date, :description, :number)
  end
end
