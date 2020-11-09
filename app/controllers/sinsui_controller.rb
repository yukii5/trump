class SinsuiController < ApplicationController
  def index
    @stage = Sinsui.new
    session[:sinsui] = @stage.get
    flash.now[:prompt] = t( "sinsui.prompt.first" )

  end

  def show
    @stage = Sinsui.new( session[:sinsui] )
    case @stage.open( params[:id].to_i )
    when -1 then
      flash.now[:prompt] = t( "sinsui.prompt.second")
    when 0 then
      flash.now[:prompt] = t( "sinsui.prompt.first")
    when 1 then
      flash.now[:prompt] = t( "sinsui.prompt.second")
    when 2 then
      flash.now[:message] = t( "sinsui.message.hazure")
      flash.now[:prompt] = t( "sinsui.prompt.close")
    when 3 then
      flash.now[:message] = t( "sinsui.message.atari")
      flash.now[:prompt] = t( "sinsui.prompt.first")
    when 4 then
      flash.now[:message] = t( "sinsui.message.finish")
    when 5 then
      flash.now[:prompt] = t( "sinsui.prompt.first")
    end
    session[:sinsui] = @stage.get
    render :index
  end
end
