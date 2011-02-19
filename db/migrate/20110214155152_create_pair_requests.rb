class CreatePairRequests < ActiveRecord::Migration
  def self.up
    create_table :pair_requests do |t|
      t.string :subject
      t.datetime :pair_date
      t.text :description
      t.string :status, :default => "Pending"
      t.integer :sender_id
      t.integer :partner_id

      t.timestamps
    end
  end

  def self.down
    drop_table :pair_requests
  end
end
