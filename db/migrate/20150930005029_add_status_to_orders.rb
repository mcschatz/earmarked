class AddStatusToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string, default: "completed"
  end
end
