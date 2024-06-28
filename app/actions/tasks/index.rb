# frozen_string_literal: true
module HanamiDddSampleTaskApp
  module Actions
    module Tasks
      # すべてのタスクを取得して表示するためのアクション
      # このクラスは Hanami::Action をincludeしており、`handle` メソッド内で適切なビューをレンダリングする
      # タスクのリストの取得とそのデータの準備は、このアクションに関連するビューオブジェクト内で行われる
      class Index < Hanami::Action
        def handle(_request, response)
          response.render(view)
        end
      end
    end
  end
end
