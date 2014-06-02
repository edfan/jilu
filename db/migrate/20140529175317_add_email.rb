class AddEmail < ActiveRecord::Migration
  def change

    change_table :teachers do |t|
      t.string :email
    end

    change_table :students do |t|
      t.string :email
    end
  end
end
