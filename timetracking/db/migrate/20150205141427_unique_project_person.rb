class UniqueProjectPerson < ActiveRecord::Migration
  def change
  	 add_index :participations, [:person_id, :project_id], unique: true
  end
end
