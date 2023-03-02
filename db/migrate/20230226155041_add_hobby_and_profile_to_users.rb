class AddHobbyAndProfileToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :hobby, :string
    add_column :users, :profile, :text
  end
end
