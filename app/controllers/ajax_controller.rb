class AjaxController < ApplicationController

  def element_update
    if request.xhr?
      @element = Element.find(params[:id])
      if @element.update(update_element_params)
        render json: "update success"
      else
        render json: "update failure"
      end
    end
  end


  private

  def update_element_params
    params.require(:element).permit(:id, :width, :heigth, :top, :left, :content)
  end
end
