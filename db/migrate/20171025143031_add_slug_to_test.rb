class AddSlugToTest < ActiveRecord::Migration
  def change
    add_column :tests, :slug, :string
    add_index :tests, :slug, unique: true
  end
end
