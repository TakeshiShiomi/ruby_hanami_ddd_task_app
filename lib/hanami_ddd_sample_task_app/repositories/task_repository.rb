module HanamiDddSampleTaskApp
  module Repositories
    class TaskRepository < ROM::Repository[:tasks]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        tasks.to_a
      end

      def find(id)
        tasks.by_pk(id).one!
      end
    end
  end
end
