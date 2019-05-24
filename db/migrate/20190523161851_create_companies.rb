class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.references :job, foreign_key: true
      t.string :name
      t.string :statement
      t.string :logo
      t.string :url
      t.string :email
      t.text :company_description

      t.timestamps
    end
  end
end
