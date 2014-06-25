module Fhzz
  module APIHelpers
    # topic helpers
    def max_page_size
      100
    end

    def default_page_size
      10
    end

    def page_size
      size = params[:size].to_i
      [size.zero? ? default_page_size : size, max_page_size].min
    end
    
    # # user helpers
    # def oauth_token
    #   # 此处的是为 ruby-china-for-ios 的 token Auth 特别设计的，不是所谓的 OAuth
    #   # 由于 NSRails 没有特别提供独立的 token 参数， 所以直接用 OAuth 那个参数来代替
    #   token = env['HTTP_AUTHORIZATION'] || ""
    #   token.split(" ").last
    # end

    # def authenticate!
    #   # @current_user = User.where(:id => "498766").first
    #   error!({ "error" => "401 Unauthorized" }, 401) unless current_user
    # end
    
    # # user helpers
    # def current_user
    #   return @current_user if not @current_user.blank?
    #   access_token = params[:access_token]
    #   user_id = params[:user_id]
    #   return nil if user_id.blank? || access_token.blank?
    #   @current_user = User.where(:id => user_id).first
    #   # 确保 access_token 能对上
    #   if @current_user and @current_user.access_token != access_token
    #     @current_user = nil
    #   end
    #   @current_user
    # end
  end
end
