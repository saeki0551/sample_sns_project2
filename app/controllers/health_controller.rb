class HealthController < ApplicationController
  def db_status
    if ActiveRecord::Base.connection.active?
      render plain: "✅ Database connection is active!"
    else
      render plain: "❌ Database connection failed!", status: 500
    end
  rescue => e
    render plain: "❌ Error: #{e.message}", status: 500
  end
end
