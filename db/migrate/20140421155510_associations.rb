class Associations < ActiveRecord::Migration
  def change
    add_reference :groups, :teacher, index: true
    add_reference :assignments, :group, index: true
    add_reference :students, :group, index: true
    add_reference :submissions, :assignment, index: true
    add_reference :submissions, :student, index: true
  end
end
