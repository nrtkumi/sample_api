# Sample_api

テストで作ってみた。ユーザーを名前によって登録（DBに保存）できるAPI

  [curl](http://d.hatena.ne.jp/thata/20100207/1265554365)とか[postman](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop?hl=ja)で試してみてください

##### POSTメソッドのリクエストのパラメータは全て埋めてリクエストしてください。NULLを認めない制約を追加しました

##### nameパラメータはuserとschoolとも重複はしないように制約を追加しました

## API

### GET /users

DBのユーザーをすべて返す

    $ curl https://rails-sample-api.herokuapp.com/users
    curlを使ったときの実行コマンド

    GET /users HTTP1.1
    Host: https://rails-sample-api.herokuapp.com/

    HTTP/1.1 200 OK
    Content-Type: application/json

    [
      {
        "name": "Takumi",
        "school_id": "3",
        "created_at": "2016-10-30T06:22:20.495Z",
        "updated_at": "2016-10-30T06:22:20.495Z",
        "school": {
          "id": 3,
          "name": "ハーバード大",
          "member": 99999,
          "place": "US",
          "description": "Oh, my god!!"
        }
      },
      {
        "name": "Takumi 2世",
        "school_id": "2",
        "created_at": "2016-10-30T06:24:12.743Z",
        "updated_at": "2016-10-30T06:24:12.743Z",
        "school": {
          "id": 2,
          "name": "京大",
          "member": 11111,
          "place": "Kyoto",
          "description": "WOOO!!!"
        }
      },
      {
        "name": "パリピ",
        "school_id": "1",
        "created_at": "2016-10-30T06:25:02.890Z",
        "updated_at": "2016-10-30T06:25:02.890Z",
        "school": {
          "id": 1,
          "name": "東大",
          "member": 12345,
          "place": "Tokyo",
          "description": "ヤバイ"
        }
      }
    ]

### POST /users

  ユーザーを作成

  nameの型はString bodyにuser[name]=name

  user[school_id]には学校のid(整数)を指定

  ex) user[name]=Takumi user[school_id]=3

    $ curl https://rails-sample-api.herokuapp.com/users -X POST -d "user[name]=Takumi" -d "user[school_id]=3"
    curlを使ったときの実行コマンド

    POST /users HTTP1.1
    Host: baseURL

    HTTP/1.1 201 OK
    Content-Type: application/json

    {
      "name": "Takumi",
      "school_id": "3",
      "created_at": "2016-10-30T06:22:20.495Z",
      "updated_at": "2016-10-30T06:22:20.495Z",
      "school": {
        "id": 3,
        "name": "ハーバード大",
        "member": 99999,
        "place": "US",
        "description": "Oh, my god!!"
      }
    }

### GET /users/:id
ユーザーの個別の情報の取得(idによる識別)

  ex) /users/1

    $ curl https://rails-sample-api.herokuapp.com/users/1
    curlを使ったときの実行コマンド

    GET /users HTTP1.1
    Host: baseURL

    HTTP/1.1 200 OK
    Content-Type: application/json

    {
      "id": 1,
      "name": "Takumi",
      "created_at": "2016-10-25T14:43:15.550Z",
      "updated_at": "2016-10-25T14:43:15.550Z"
    }

### PATCH /users/:id
ユーザー情報の更新

  POST /users と同様bodyにuser[name]=name

  ex) PATCH /users/1 user[name]=www


    $ curl https://rails-sample-api.herokuapp.com/users/1 -X PATCH -d "user[name]=www"
    curlを使ったときの実行コマンド

    PATCH /users/1 HTTP1.1
    Host: baseURL

    HTTP/1.1 200 OK
    Content-Type: application/json

    {
      "id": 1,
      "name": "www",
      "created_at": "2016-10-25T14:43:15.550Z",
      "updated_at": "2016-10-25T16:31:05.856Z"
    }

### DELETE /users/:id
ユーザーの削除

  ex) DELETE /users/1

  idが1のユーザーが削除される

    $ curl https://rails-sample-api.herokuapp.com/users/1 -X DELETE
    curlを使ったときの実行コマンド

### GET /schools
登録された学校を全て取得

    $ curl https://rails-sample-api.herokuapp.com/schools
    curlを使ったときの実行コマンド

    [
      {
        "id": 1,
        "name": "東大",
        "member": 12345,
        "place": "Tokyo",
        "description": "ヤバイ",
        "created_at": "2016-10-30T06:18:33.984Z",
        "updated_at": "2016-10-30T06:18:33.984Z"
      },
      {
        "id": 2,
        "name": "京大",
        "member": 11111,
        "place": "Kyoto",
        "description": "WOOO!!!",
        "created_at": "2016-10-30T06:19:07.814Z",
        "updated_at": "2016-10-30T06:19:07.814Z"
      },
      {
        "id": 3,
        "name": "ハーバード大",
        "member": 99999,
        "place": "US",
        "description": "Oh, my god!!",
        "created_at": "2016-10-30T06:20:21.374Z",
        "updated_at": "2016-10-30T06:20:21.374Z"
      }
    ]

### POST /schools
学校の追加

  ex) school[name]=東大 school[member]=1000 school[place]=Tokyo school[description]=すごい

    $ curl https://rails-sample-api.herokuapp.com/schools -X POST -d "school[name]=東大" -d "school[member]=1000" -d"school[place]=Tokyo" -d "school[description]=すごい"
    curlを使ったときの実行コマンド

    {
      "id": 1,
      "name": "東大",
      "member": 1000,
      "place": "Tokyo",
      "description": "すごい",
      "created_at": "2016-10-30T06:18:33.984Z",
      "updated_at": "2016-10-30T06:18:33.984Z"
    }

### GET /schools/:id

登録された学校を取得(idによる)

    $ curl https://rails-sample-api.herokuapp.com/schools/1
    curlを使ったときの実行コマンド

    {
      "id": 1,
      "name": "東大",
      "member": 12345,
      "place": "Tokyo",
      "description": "ヤバイ",
      "created_at": "2016-10-30T06:18:33.984Z",
      "updated_at": "2016-10-30T06:18:33.984Z"
    }
