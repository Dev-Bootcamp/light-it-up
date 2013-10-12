class ElementsController < ApplicationController

  def index
    @elements = Element.all
  end

  def create
    @element = Element.new(create_params)
  end

  def new
    @element = Element.new(element_type_id: params[:type_id], slide_id: session[:edit_slide_id])
    if request.xhr?
      @element.save!
      render json: {element: @element, type: @element.element_type}
    else
      redirect_to slide_path(@slide)
    end
  end

  def edit

  end

  def destroy

  end


  private

  def create_params
    params.require(:element).permit(:content, :slide_id, :element_type_id, :size, :coordinates)
  end

end
