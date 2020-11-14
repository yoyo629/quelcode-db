# QUELCODE データベース課題

## ディレクトリ解説

```
quelcode-php
├── db ....................... 作成した課題の提出場所
│   ├──db-challenge3・・・・・・・・・・sql課題を元にsql文作成及びスクショ添付
├── mysql5.7
│   ├── mysql .................. 起動すると作られる。データ永続化用
│   ├── mysqlvolume ............ mysqlコンテナにマウントされる。ホストとのファイル受け渡し用
│   └── my.cnf ................. mysqlコンテナの設定ファイル
│  
├── .gitignore
├── docker-compose.yml
└── README.md
```

## データベース情報
MySQLバージョン 5.7.x

## phpMyAdmin接続方法

Dockerを立ち上げた後以下のアドレスにアクセスする

http://localhost:10081
