class Item < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  # 用于 Carrierwave 上传是临时存放随机生成的文件名编号，给不同的图片版本使用
  attr_accessor :uploader_secure_token
  belongs_to :category
end
