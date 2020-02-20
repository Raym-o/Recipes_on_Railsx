class CreateFoodgroups < ActiveRecord::Migration[6.0]
  def change
    create_table :foodgroups do |t|
      t.string :name
      t.string :suggested_serving

      t.timestamps
    end
  end
end
