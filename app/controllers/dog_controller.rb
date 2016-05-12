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

  def show 
    $id = sanitize(params[:id])
    @Dog = Dog.find($id)
    render :json => @Dog
  end
end
