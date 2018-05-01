class IndexController < ApplicationController
  def home
  	@slides = Slide.all
  end

  def services
  end

  def about
  end

  def contact
  	@message = Message.new
  end
end
