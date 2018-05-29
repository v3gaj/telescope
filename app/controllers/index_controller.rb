class IndexController < ApplicationController
  def home
  	@slides = Slide.all
    @jobs = Job.all.where(status: "open").order(created_at: :desc).limit(10)
  end

  def services
    @services = Service.all
  end

  def about
    @values = Value.all
  end

  def contact
  	@message = Message.new
  end
end
