class EditNames < ActiveRecord::Migration
  def change
    
    change_table :teachers do |t|
      t.remove :first_name, :last_name
      t.string :name
    end

    change_table :students do |t|
      t.remove :first_name, :last_name
      t.string :name
    end
    
    change_table :submissions do |t|
      t.string :name
    end
    
  end
end
