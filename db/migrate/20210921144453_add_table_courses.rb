class AddTableCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :short_name
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
