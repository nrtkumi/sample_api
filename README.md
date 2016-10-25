# Sample_api

テストで作ってみた。ユーザーを名前によって登録（DBに保存）できるAPI

  [curl](http://d.hatena.ne.jp/thata/20100207/1265554365)とか[postman](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop?hl=ja)で試してみてください

***baseURL:***

https://image-url.gif

## API

### GET /users

DBのユーザーをすべて返す

    GET /users HTTP1.1
    Host: baseURL

    HTTP/1.1 200 OK
    Content-Type: application/json

    [
      {
        "id": 1,
        "name": "Takumi",
        "created_at": "2016-10-25T14:43:15.550Z",
        "updated_at": "2016-10-25T14:43:15.550Z"
      },
      {
        "id": 3,
        "name": "takuminara",
        "created_at": "2016-10-25T15:17:43.583Z",
        "updated_at": "2016-10-25T15:17:43.583Z"
      },
      {
        "id": 4,
        "name": "takuminara",
        "created_at": "2016-10-25T15:25:36.907Z",
        "updated_at": "2016-10-25T15:25:36.907Z"
      },
      {
        "id": 5,
        "name": "takuminara",
        "created_at": "2016-10-25T15:28:46.635Z",
        "updated_at": "2016-10-25T15:28:46.635Z"
      } ...
    ]

### POST /users

  ユーザーを作成

  nameの型はString bodyにuser[name]=name

  ex) user[name]=Takumi

    POST /users HTTP1.1
    Host: baseURL

    HTTP/1.1 201 OK
    Content-Type: application/json

    {
      "id": 6,
      "name": "Takumi",
      "created_at": "2016-10-25T16:02:59.767Z",
      "updated_at": "2016-10-25T16:02:59.767Z"
    }

### GET /users/:id
ユーザーの個別の情報の取得(idによる識別)

  ex) /users/1

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
