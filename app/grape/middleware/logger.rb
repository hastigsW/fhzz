module Middleware
  class Logger < ::Grape::Middleware::Base
    def call!(env)
      env["log_start_t"] = Time.now
      query_hash = env["rack.request.query_hash"] || {}
      form_hash = env["rack.request.form_hash"] || {}
      Rails.logger.info "Parameters: #{query_hash.merge(form_hash).except("route_info")}"
      
      @app_response = @app.call(env)
      
      log_runtime_info(env, @app_response[0])
      
      @app_response
    end
    
    def log_runtime_info(env, status)
      @log_end_t = Time.now
      total_runtime = ((@log_end_t -  env["log_start_t"]) * 1000).round(1)
      db_runtime = (ActiveRecord::LogSubscriber.runtime || 0).round(1)
      Rails.logger.info "Completed #{status} in #{total_runtime}ms (ActiveRecord: #{db_runtime}ms)"
    end
  end
end