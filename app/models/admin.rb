class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #バイデーションはいらない  
  # validates :genre_id, presence: true
  # validates :name, presence: true
  # validates :introduction, presence: true
  
  # もし写真を持っていなかったらunless、持ってたらその写真を表示
  # def get_image(width, height)
  #   unless image.attached?
  #     file_path = Rails.root.join('app/assets/images/no_image.jpg')
  #     image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
  #   end
  #     image.variant(resize_to_limit: [width, height]).processed
  # end

end
