class AjaxController < ApplicationController

  def element_update
    if request.xhr?
      @element = Element.find(params[:id])
      if @element.update(update_element_params)
        render json: { status: "save_ok"}
      else
        render json: { status: "save_error"}
      end
    end
  end

  def slide_update
    if request.xhr?
      @slide = Slide.find(params[:id])
      @slide.update(params[:background_color])
    end 
  end


  private

  def update_element_params
    params.require(:element).permit(:id, :width, :heigth, :top, :left, :content)
  end
end
