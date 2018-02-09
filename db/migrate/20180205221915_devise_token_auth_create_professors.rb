class DeviseTokenAuthCreateProfessors < ActiveRecord::Migration[5.0]
  def change
    create_table(:professors) do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## User Info
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :image
      t.string :email
      t.integer :mobile_phone
      t.integer :phone
      t.integer :faculty_id
      t.integer :city_id
      t.string :facebook
      t.string :street_name
      t.string :street_number
      t.integer :floor
      t.integer :apartment_number

      ## Tokens
      t.json :tokens

      t.timestamps
    end

    add_index :professors, :email,                unique: true
    add_index :professors, [:uid, :provider],     unique: true
    add_index :professors, :reset_password_token, unique: true
    add_index :professors, :confirmation_token,   unique: true
    # add_index :professors, :unlock_token,       unique: true
  end
end