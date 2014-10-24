class CreateInsults < ActiveRecord::Migration
  def change
    create_table :insults do |t|
      t.string   :ye_olde_columne_one
      t.string   :ye_olde_columne_two
      t.string   :ye_olde_columne_three

      t.timestamps
    end
  end
end