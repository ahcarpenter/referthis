class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.integer :referee_id
      t.integer :user_id
      t.integer :visits, :default => 0

      t.timestamps
    end
  end
end