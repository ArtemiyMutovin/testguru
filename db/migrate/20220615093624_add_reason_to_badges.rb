class AddReasonToBadges < ActiveRecord::Migration[7.0]
  def change
    add_column :badges, :reason, :string, null: false, default: :Reason
  end
end
