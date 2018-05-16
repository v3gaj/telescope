class AddPhotoToUser < ActiveRecord::Migration[5.2]
  def change
  	add_attachment :users, :photo
  end
end
