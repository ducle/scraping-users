class AddAgeToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :birthday
    add_column    :users, :age, :integer
  end
end
