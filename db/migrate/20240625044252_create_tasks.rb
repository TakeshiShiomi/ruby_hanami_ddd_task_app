# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :tasks do
      primary_key :id
      column :name, String, null: false
      column :due_date, Date, null: false
      column :task_status, String, null: false, default: 'undone'
      column :postpone_count, Integer, null: false, default: 0

      column :created_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
      column :updated_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end
