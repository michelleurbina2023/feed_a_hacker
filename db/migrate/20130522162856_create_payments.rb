class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :hacker
      t.decimal :amount, :scale => 2, :precision => 10, :default => 0.0
      t.decimal :fee, :scale => 2, :precision => 10, :default => 0.0
      t.string :charge_identifier
      t.boolean :test_mode, :default => false

      t.timestamps
    end
    add_index :payments, :hacker_id
    add_index :payments, :test_mode
  end
end