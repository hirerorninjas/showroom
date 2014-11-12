class Product < ActiveRecord::Base
 attr_accessible :name, :category_id, :photo, :user_id
 has_attached_file :photo, :styles => { :small => "150x150>" },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  validates :name, presence: true
  validates_uniqueness_of :name
  belongs_to :category
  belongs_to :user

  before_create  :check_user 

  private
  def check_user
    if User.find(self.user_id).admin == true
    end
  end

end
