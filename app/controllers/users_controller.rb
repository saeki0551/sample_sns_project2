class UsersController < ApplicationController
    def top
      respond_to do |format|
        format.html # HTML形式
        format.json { render json: @data } # JSON形式
      end
    end
  end
  