class CreatePaxfulEngineTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :paxful_engine_trades do |t|
      t.column :trade_hash, :string, null: false
      t.column :offer_hash, :string, null: false
      t.column :offer_type, :string, null: false
      t.column :fiat_amount_requested, :decimal, null: false
      t.column :fiat_currency_code, :string, null: false
      t.column :crypto_amount_requested, :decimal, null: false
      t.column :crypto_currency_code, :string, null: false
      t.column :started_at, :datetime, null: false
      t.column :ended_at, :datetime, null: false
      t.column :completed_at, :datetime
      t.column :seller, :string, null: false
      t.column :buyer, :string, null: false
      t.column :status, :string, null: false
      t.column :payment_method_name, :string

      t.timestamps
    end

    add_index :paxful_engine_trades, :trade_hash, unique: true
  end
end
