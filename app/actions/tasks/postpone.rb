# frozen_string_literal: true

# Actionsモジュールは、アプリケーションのビジネスロジックを実行するアクションを定義します。
module Actions
  # Tasksモジュールは、タスク関連のアクションを定義します。
  module Tasks
    # Postponeクラスは、指定されたタスクの延期を処理するアクション
    # タスクIDをパラメータとして受け取り、タスクの延期処理を実行
    # 処理が成功した場合は、タスク一覧ページにリダイレクトし、「Task was successfully postponed.」という通知を表示
    # 不正なパラメータが渡された場合は、422ステータスコードとエラーメッセージを返す
    class Postpone
      include Web::Action

      # タスクを延期
      #
      # @param params [Hash] タスクのパラメータ
      # @raise [ArgumentError] パラメータが不正な場合に発生する
      def call(params)
        task_id = params[:id]

        HanamiDddSampleTaskApp::UseCases::TaskPostponeUseCase.new.postpone_task(task_id)
        redirect_to routes.tasks_path, notice: 'Task was successfully postponed.'
      rescue ArgumentError => e
        self.status = 422
        self.body = e.message
      end
    end
  end
end
