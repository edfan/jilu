class Login < ActiveRecord::Migration
  def change

    change_table :students do |t|
      t.string :password_salt
      t.remove :password
    end

    change_table :teachers do |t|
      t.string :password_salt
      t.remove :password
    end
  end
end
