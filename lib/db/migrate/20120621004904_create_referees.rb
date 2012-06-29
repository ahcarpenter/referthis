class CreateReferees < ActiveRecord::Migration
  def change
    create_table :referees do |t|
      t.string :endpoint

      t.timestamps
    end
  end
end