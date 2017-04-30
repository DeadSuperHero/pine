class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :articles, dependent: :destroy

  def author_params
     # It's mandatory to specify the nested attributes that should be whitelisted.
     # If you use `permit` with just the key that points to the nested attributes hash,
     # it will return an empty hash.
     params.require(:author).permit(:name, :email, :avatar)
   end

end
