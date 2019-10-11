

# Group Login


## Login [/login]


### Index a session [POST /api/v1/sign_in]


+ Request when success login user
**POST**&nbsp;&nbsp;`/api/v1/sign_in`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "email": "keenan@haleyblanda.name",
              "password": "test_pswd"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "byJtzzjEQKWtS8YWGbzclt7prejb6qerT45irlQ+5MRIIXAMqYgBOaVTJoGN7YjYURow22u5/J3cE78NM+3o5Q=="
            }

+ Request when failed login user
**POST**&nbsp;&nbsp;`/api/v1/sign_in`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "detail": "Not authorized"
                }
              ]
            }

### Destroy a session [DELETE /api/v1/sign_out]


+ Request when success destroy session
**DELETE**&nbsp;&nbsp;`/api/v1/sign_out`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            "ok"

+ Request when not authorized
**DELETE**&nbsp;&nbsp;`/api/v1/sign_out`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "detail": "Not authorized"
                }
              ]
            }

# Group Registrations


## Registrations [/registrations]


### Create a user [POST /api/v1/registration]


+ Request valid param
**POST**&nbsp;&nbsp;`/api/v1/registration`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "email": "test1@gmail.com",
              "password": "qwert123",
              "password_confirmation": "qwert123"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "vGlnr5kIqvKysxo/5dg4soxBLDy95C0jjIGF2Bpsx+VcZdkOEqfAgI070MLua9bLivZmLBPnNKBcWJrCQeDrfQ==",
              "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NzA4MDU4ODQsInVzZXJfaWQiOjQ0NCwidWlkIjoiYzI5NDE0NWQtZmQ1MS00OTVhLWJkOTYtZjI5NDNjMjY5ZDllIiwiZXhwIjoxNTcwODA1ODg0fQ.LLPa_48A6tVBlHXInEoVfbR9q1KTSfPb_yzZiKVMydY",
              "access_expires_at": "2019-10-11T17:58:04.000+03:00",
              "refresh": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NzA4MDU4ODQsInVpZCI6ImRkODU4OWM1LTBlY2UtNGYyNi04NTI0LWRhMzM4NWIwNzJiMyIsImV4cCI6MTU3MTQwNzA4NH0.s6ioDBsGNz4c7UMav2cjPIDsvI6XTAasDbQ6XUroMto",
              "refresh_expires_at": "2019-10-18T16:58:04.000+03:00"
            }

+ Request invalid params
**POST**&nbsp;&nbsp;`/api/v1/registration`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "email": "test1@gmail.com",
              "password": "qwert123",
              "password_confirmation": null
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "password_confirmation": [
                "can't be blank"
              ]
            }
