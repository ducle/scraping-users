class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string       :slug, required: true, index: true
      t.string       :name
      t.datetime     :birthday
      t.timestamps
    end
  end
end
