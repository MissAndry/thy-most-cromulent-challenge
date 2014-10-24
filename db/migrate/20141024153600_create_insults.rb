class CreateInsults < ActiveRecord::Migration
  def change
    create_table :insults do |t|
      t.string   :text

      t.timestamps
    end
  end
end