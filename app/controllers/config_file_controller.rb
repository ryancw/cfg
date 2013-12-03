class ConfigFileController < ApplicationController

  def show
    @cfg = ConfigFile.find(params[:id])
  end

  def new
  end

  def create
    @cfg = ConfigFile.new(cfg_params)
    @cfg.save
    redirect_to @cfg
  end

  private
  def cfg_params
    params.require(:config_file).permit(:title, :author, :configs)
  end
end
