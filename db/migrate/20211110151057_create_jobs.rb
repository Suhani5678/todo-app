class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.string :qualification
      t.string :required_skills
      t.string :number_of_position
      t.string :location
      t.string :employment_type
      t.string :joining_time
      t.string :package
      t.string :experience_required

      t.timestamps
    end
  end
end
