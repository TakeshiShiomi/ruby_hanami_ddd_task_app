# frozen_string_literal: true

require 'rom'

module HanamiDddSampleTaskApp
  module Entities
    # Task エンティティはタスクの属性と振る舞いを定義します。
    # タスクはID、名前、期限、タスクの状態（未完了または完了）、延期回数を属性として持ちます。
    # また、タスクは最大延期回数を超えない範囲で延期することができます。

    class Task < ROM::Struct
      POSTPONE_MAX_COUNT = 3

      def postpone
        raise ArgumentError, '最大延期回数を超過しています' if postpone_count >= POSTPONE_MAX_COUNT

        self.due_date = due_date + 1
        self.postpone_count += 1
      end
    end
  end
end
