# frozen_string_literal: true

module HanamiDddSampleTaskApp
  module UseCases
    # タスクの延期処理を担当
    # このクラスは、指定されたタスクの延期を行い、それをリポジトリに保存する責務を持つ
    class TaskPostponeUseCase
      def initialize(task_repository = TaskRepository.new)
        @task_repository = task_repository
      end

      # タスクの期限を延期します。
      #
      # @param task_id [Integer] タスクのID
      # @raise [ArgumentError] タスクが見つからない場合に発生します
      def postpone_task(task_id)
        task = @task_repository.find(task_id)
        task.postpone
        @task_repository.update(task)
      end
    end
  end
end
