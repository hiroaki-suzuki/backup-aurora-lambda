# Auroraでの特定テーブルのバックアップ

mysqldumpを利用して実現。  
Lambdaのイメージを作り、シェルを実行してS3にアップロード。

## ローカル環境

1. cf-template-local.yamlでローカル用のサービスをAWSに作る
2. .env.sampleをコピーして.envを作り変数を設定する
3. docker-compose up でローカルの環境を構築, 実行する
4. 以下のコマンドで、ローカル環境に向けて、リクエストを発行する
    1. curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'
5. レスポンスでS3にアップロードしたファイル名が出力され、DockerのログにLambdaのログが出力される
6. S3を確認して、ファイルが有れば成功