class Contact < ApplicationRecord

  validates :name, presence: { message: '名前をご記入ください' }
  validates :email, presence: {message: 'メールアドレスをご記入ください'}
  validates :message, presence: { message: '本文をご記入ください' }


end
