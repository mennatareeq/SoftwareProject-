class SliderController < ApplicationController
  def show

    @images_path = "/uploads/pdf/attachment/#{params[:id]}/"

  end
end
