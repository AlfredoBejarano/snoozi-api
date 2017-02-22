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
        :created_at,
        :description,
        :found_date,
        :found_location,
        :gender
      ], 
      :methods => [        
        :thumb_url
      ]
    )
  end

  def create

    sanitize_params = dog_params.delete :id

    @Dog = Dog.new(sanitize_params)
  
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
    if(Dog.exists?($id))
      @Dog = Dog.find($id)
      render json: @Dog.as_json(
        :only => [
          :id,
          :breed,
          :color,
          :created_at,
          :description,
          :found_date,
          :found_location,
          :gender,
          :number
        ], 
        :methods => [        
          :image_url
        ]
      )
    else
      render json: { "code":"404" }
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:breed, :color, :gender, :found_location, :found_date, :description, :number, :image)
  end
end
