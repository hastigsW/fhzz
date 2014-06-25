# encoding: utf-8
require "api/helpers"

module Fhzz
  class API < Grape::API
    prefix "api"
    format :json
    
    use Middleware::Logger

    helpers APIHelpers

    resource :home do
      get do
        Category.includes(:items).all.to_json(
          include: { items: {} }
        )
      end
    end

    resource :categories do
      desc "获取分类详情"
      get ':id', requirements: { id: /[0-9]*/ } do
        Category.includes(:items).find(params[:id]).as_json(
          include: { items: {} }
        )
      end 
    end

    # resource :item_types do
    #   desc "获取二级分类详情"
    #   get ':id', requirements: { id: /[0-9]*/ } do
    #     ItemType.includes(:items).find(params[:id]).to_json(
    #       include: { items: {} }
    #     )
    #   end 
    # end 

    resource :news do
      desc "获取新闻"
      params do
        optional :page, type: Integer, desc: "第几页"
        optional :per_page, type: Integer, desc: "一页数量, 默认 10"
      end
      get do 
        news = News.recent.paginate(:page => params[:page], :per_page => params[:page_size] || 15)
        news.as_json
      end
    end

    resource :items do
      desc "获取产品详情"
      get ':id', requirements: { id: /[0-9]*/ } do
        Item.find(params[:id]).as_json
      end 
    end 

    resource :bunner do
      desc "轮播图片"
      get do
        root_url = "http://192.168.0.104:3000/" 
        ["111.jpg", "222.jpg", "333.jpg", "444.jpg"].collect{|image| root_url + "assets/" + image}
      end
    end


  end
end