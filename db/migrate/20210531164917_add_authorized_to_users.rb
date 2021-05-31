class AddAuthorizedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :authorized, :boolean, default: true
  end
end
