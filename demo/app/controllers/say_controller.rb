class SayController < ApplicationController
  def hello
  	@time = Time.now;
  end

  def goodbey
  end
end
