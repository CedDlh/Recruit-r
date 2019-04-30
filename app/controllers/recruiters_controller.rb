class RecruitersController < ApplicationController

  def index
    @recruiters = Recruiter.all
  end
end
