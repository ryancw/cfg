class ConfigFileController < ApplicationController

  def show
    @cfg = ConfigFile.find(params[:id])
  end

  def new
    @categories = YAML.load(File.open("#{Rails.root}/config/configs.yml", 'r'))
  end

  def create
    @cfg = ConfigFile.new(cfg_params)
    @cfg.save
    redirect_to @cfg
  end

  def index
    @cfgs = ConfigFile.all
  end

  def download
    cfg = ConfigFile.find(params[:id])
    send_data cfg.as_file,
      filename: 'autoexec.cfg'
  end

  private
  def cfg_params
    params.require(:config_file).permit!
  end
end
