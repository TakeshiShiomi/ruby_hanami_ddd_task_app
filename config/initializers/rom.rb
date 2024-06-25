require 'rom'
require 'rom-sql'
require 'pg'

ROM_CONTAINER = ROM.container(:sql, 'postgres://localhost:5432/task_development') do |config|
  config.default.create_table(:tasks) do
    primary_key :id
    column :name, String, null: false
    column :due_date, Date, null: false
    column :task_status, String, null: false
    column :postpone_count, Integer, default: 0
  end

  config.relation(:tasks) do
    schema(infer: true)
  end

  config.register_relation(HanamiDddSampleTaskApp::Persistence::Relations::Tasks)
end
