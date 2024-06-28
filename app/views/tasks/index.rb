module HanamiDddSampleTaskApp
  module Views
    module Tasks
      class Index < Hanami::View
        include Deps['persistence.rom']

        expose :tasks do
          rom.relations[:tasks]
             .select(:id, :name, :due_date, :postpone_count, :task_status)
             .to_a
        end
      end
    end
  end
end
