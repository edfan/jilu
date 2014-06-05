class FixPassword < ActiveRecord::Migration
  def change

    change_table :teachers do |t|
      t.remove :password_hash, :password_salt
      t.string :password_digest
    end
    
  end
end
