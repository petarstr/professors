class AddDefaultTables < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.datetime :created_at,  default: :now, null: false
      t.datetime :updated_at,  default: :now, null: false
    end
    create_table :faculties do |t|
      t.string :name, null: false
      t.references :city, null: false, foreign_key: true
      t.datetime :created_at,  default: :now, null: false
      t.datetime :updated_at,  default: :now, null: false
    end

    create_table :courses do |t|
      t.string :title, null: false
      t.references :faculty, null: false, foreign_key: true
      t.datetime :created_at,  default: :now, null: false
      t.datetime :updated_at,  default: :now, null: false
    end

    create_table :subjects do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.references :course, null: false, foreign_key: true
      t.datetime :created_at,  default: :now, null: false
      t.datetime :updated_at,  default: :now, null: false
    end
    add_index :subjects, [:title, :course_id], unique: true

    create_table :offers do |t|
      t.references :professor, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description, null: false
      t.integer :number_of_sessions, null: false
      t.boolean :user_place, default: false
      t.boolean :professor_place, default: true
      t.datetime :created_at,  default: :now, null: false
      t.datetime :updated_at,  default: :now, null: false
    end

    create_table :prices do |t|
      t.references :offer, null: false, foreign_key: true
      t.integer :student_count, null: false
      t.decimal :price, null: false
    end
    add_index :prices, [:offer_id, :student_count, :price], unique: true

    create_table :offers_subjects do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.datetime :created_at,  default: :now, null: false
      t.datetime :updated_at,  default: :now, null: false
    end
    add_index :offers_subjects, [:offer_id, :subject_id], unique: true

    create_table :reviews do |t|
      t.text :comment
      t.integer :rating, null: false
      t.references :professor, null: false, foreign_key: true
      t.references :offer, null: false
      t.references :user, null: false
    end
  end
end
