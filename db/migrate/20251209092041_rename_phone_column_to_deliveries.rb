class RenamePhoneColumnToDeliveries < ActiveRecord::Migration[7.1]
  def change
    rename_column :deliveries, :phone, :phone_number
  end
end
