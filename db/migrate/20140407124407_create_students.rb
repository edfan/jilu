class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :password_hash
      t.string :grade

      t.timestamps
    end
  end
end
