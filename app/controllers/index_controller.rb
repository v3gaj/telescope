class IndexController < ApplicationController
  def home
  	@slides = Slide.all
    @jobs = Job.all.order(created_at: :desc).limit(10)
  end

  def services
  end

  def about
  end

  def contact
  	@message = Message.new
  end
end
