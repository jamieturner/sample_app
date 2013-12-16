class MappingsController < ApplicationController
  def index
    @mappings = Mapping.all
  end


  def import
    Mapping.import(params[:file])
    redirect_to root_url, notice: "Mappings imported."
  end




end