class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description
      t.string :autor
      t.references :article

      t.timestamps
    end
  end
end
