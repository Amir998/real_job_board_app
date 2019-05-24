class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :category
      t.string :job_type
      t.string :headquarters
      t.string :region
      t.string :apply_link
      t.text :description

      t.timestamps
    end
  end
end
