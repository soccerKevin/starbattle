class CreateSquare < ActiveRecord::Migration
  def change
    create_table :squares do |t|
      t.references :map
      t.integer    :group_index
      t.string     :color
      t.string     :state
    end
  end
end
