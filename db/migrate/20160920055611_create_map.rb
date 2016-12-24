class CreateMap < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :name
      t.integer :width
    end
  end
end
