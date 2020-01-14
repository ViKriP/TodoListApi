

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
              "email": "antone@rohan.name",
              "password": "test_pswd"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "yA30qiKAfuc2NlCxYa2x1q2jZkjEz+3l9OJ4tix2dUOFjMRDFvP9jVh7A9g0kHrmaO66My0mK6L+ymvhD3M21Q=="
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

# Group Projects


## Projects [/projects]


### Create a project [POST /api/v1/projects]


+ Request creates a new project
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            project[name]=et

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "772",
                "type": "project",
                "attributes": {
                  "id": 772,
                  "name": "et"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "823",
                      "type": "user"
                    }
                  }
                }
              }
            }

### Update a project [PUT /api/v1/projects/{id}]

+ Parameters
    + id: `776` (number, required)

+ Request updates project
**PUT**&nbsp;&nbsp;`/api/v1/projects/776`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            project[name]=vero

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "776",
                "type": "project",
                "attributes": {
                  "id": 776,
                  "name": "vero"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "824",
                      "type": "user"
                    }
                  }
                }
              }
            }

### Delete a project [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `777` (number, required)

+ Request deletes project
**DELETE**&nbsp;&nbsp;`/api/v1/projects/777`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "deleted": true
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
              "csrf": "/C2EmrPK0TOFNnuH4M6Mr8dYOui3frEf3vQUbQpejfbJ71x6yl2eDdmp5tkgMWGzss8Hb5nmCPETkdJGRNHorg==",
              "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1Nzg4NzEyNzgsInVzZXJfaWQiOjgyNiwidWlkIjoiNzQxZDFhYmItNzRjOS00ZDIwLWI3M2QtYjNmOTc0NGE1MDQ0IiwiZXhwIjoxNTc4ODcxMjc4fQ.5Q7xhdguQ19ezHcse51ZcEN7J0C-Q9lyMTJ3AZ_i1Gc",
              "access_expires_at": "2020-01-13T01:21:18.000+02:00",
              "refresh": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1Nzg4NzEyNzgsInVpZCI6ImY2Y2M5NzQ4LTJiNmEtNDMxNC1iZTU0LTk2ZDlkMmY3ZDBhOCIsImV4cCI6MTU3OTQ3MjQ3OH0.pwqK6VCrmrZarSKxoOYknhuZ9-KgI8BLUm4GT5msdfE",
              "refresh_expires_at": "2020-01-20T00:21:18.000+02:00"
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
