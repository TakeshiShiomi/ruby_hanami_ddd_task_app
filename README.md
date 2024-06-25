# HanamiDddSampleTaskApp

# HanamiDddSample

- データフローに関する部分は apps/ 以下に、 ビジネスロジック(アプリケーションのドメイン固有のロジック)に関する部分は lib/ 以下に定義する。
- apps/ 以下には Routing 、 Controller 、 View 、 Assets に関するもの、 lib/ 以下には Model(Repository と Entity)と Interactor に関するものを置く。
- Hanami では Model を Repository と Entity の 2 層で表現している。
- Use Case はアプリケーション層に配置。ユースケースは、ドメインロジックを実行するためのサービスやインタラクターとして機能し、エンティティやリポジトリと連携
- Hanami 2.0 以降では、ディレクトリ構造が変更され、`web`ディレクトリがなくなり、Controller は通常 app/actions ディレクトリに配置(以下説明)
- Actions モジュールは、アプリケーションのビジネスロジックを実行するアクションを定義
  https://guides.hanamirb.org/v2.1/actions/overview/
- View は`app/templates`ディレクトリに記述

- hanami で postgresql 導入とテーブル作成方法は下記サイト参照
  https://guides.hanamirb.org/v2.1/introduction/building-a-web-app/#adding-a-new-route-and-action

## 参照サイト

https://guides.hanamirb.org/v2.1/introduction/getting-started/
https://magazine.rubyist.net/articles/0056/0056-hanami.html
https://note.com/sq_engch5/n/n850fe5801832
https://qiita.com/park-jh/items/e790736e61d7b39a42b9
