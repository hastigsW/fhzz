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
        cates = Category.includes(:items).all
        cates.map do |cate|
          {
            id: cate.id,
            name: cate.name,
            items: cate.items.collect{ |item|
              {
                id: item.id,
                category_id: item.category_id,
                name: item.name,
                sub_title: item.sub_title,
                desc: item.desc,
                image_url: item.avatar.url,
                url: item.url,
                v_type: item.v_type
              }
            }
          }
        end
      end
    end

    resource :categories do
      desc "获取分类详情"
      get ':id', requirements: { id: /[0-9]*/ } do
        cate = Category.includes(:items).find(params[:id])
        {
          id: cate.id,
          name: cate.name,
          items: cate.items.collect{ |item|
            {
              id: item.id,
              category_id: item.category_id,
              name: item.name,
              sub_title: item.sub_title,
              desc: item.desc,
              image_url: item.avatar.url,
              url: item.url,
              v_type: item.v_type
            }
          }
        }
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
        news.map do |news|
          {
            id: news.id,
            title: news.title,
            image: news.avatar.url,
            url: news.url,
            content: news.content
          }
        end
      end
    end

    resource :items do
      desc "获取产品详情"
      get ':id', requirements: { id: /[0-9]*/ } do
        item = Item.find(params[:id])
        {
          id: item.id,
          category_id: item.category_id,
          name: item.name,
          sub_title: item.sub_title,
          desc: item.desc,
          image_url: item.avatar.url,
          url: item.url,
          v_type: item.v_type
        }
      end 
    end 

    resource :bunners do
      desc "轮播图片"
      get do
        Bunner.recent.limit(4).map do |bunner|
          bunner.avatar.url
        end
      end
    end


  end
end