# frozen_string_literal: true

module HanamiDddSampleTaskApp
  # Actionsモジュールは、アプリケーションのビジネスロジックを実行するアクションを定義
  module Actions
    # Tasksモジュールは、タスク関連のアクションを定義
    module Tasks
      # Createクラスは、タスク作成の処理を行うアクション
      # 新しいタスクを作成し、成功時にタスク一覧ページにリダイレクトする
      # 不正なパラメータが渡された場合は、422ステータスコードとエラーメッセージを返す
      class Create
        include Web::Action

        # タスクを作成し、成功時にタスク一覧ページにリダイレクトする
        #
        # @param params [Hash] タスクのパラメータ
        # @raise [ArgumentError] パラメータが不正な場合に発生します
        def call(params)
          name = params[:task][:name]
          due_date = Date.parse(params[:task][:due_date])

          HanamiDddSampleTaskApp::UseCases::TaskCreateUseCase.new.create_task(name, due_date)
          redirect_to routes.tasks_path, notice: 'Task was successfully created.'
        rescue ArgumentError => e
          self.status = 422
          self.body = e.message
        end
      end
    end
  end
end
