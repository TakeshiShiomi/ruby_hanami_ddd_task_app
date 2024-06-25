# frozen_string_literal: true

module HanamiDddSampleTaskApp
  module UseCases
    # タスク作成のユースケースを担当
    # このクラスは、新しいタスクを作成し、それをリポジトリに保存する責務を持つ
    class TaskCreateUseCase
      def initialize(task_repository = TaskRepository.new)
        @task_repository = task_repository
      end

      # 新しいタスクを作成
      #
      # @param name [String] タスクの名前
      # @param due_date [Date] タスクの期限
      # @raise [ArgumentError] 必須項目が設定されていない場合に発生します
      def create_task(name, due_date)
        raise ArgumentError, '必須項目が設定されていません' if name.nil? || due_date.nil?

        task = Entities::Task.new(
          name: name,
          due_date: due_date,
          task_status: 'undone',
          postpone_count: 0
        )
        @task_repository.create(task)
      end
    end
  end
end
