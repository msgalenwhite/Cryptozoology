class RequireUserOnCryptid < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cryptids, :user_id, false 
  end
end
