

# Group Comments


## Comments [/comments]


### Create a comment [POST /api/v1/tasks/{task_id}/comments]

+ Parameters
    + task_id: `1` (number, required)

+ Request create comment
**POST**&nbsp;&nbsp;`/api/v1/tasks/1/comments`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "comment": {
                "text": "63w9umog3s9",
                "task_id": 1
              }
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1",
                "type": "comment",
                "attributes": {
                  "text": "63w9umog3s9",
                  "attachment": {
                    "url": null,
                    "thumb": {
                      "url": null
                    }
                  }
                },
                "relationships": {
                  "task": {
                    "data": {
                      "id": "1",
                      "type": "task"
                    }
                  }
                }
              }
            }

+ Request not create comment
**POST**&nbsp;&nbsp;`/api/v1/tasks/2/comments`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "text": ""
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "task": [
                "must exist"
              ],
              "text": [
                "can't be blank",
                "is too short (minimum is 10 characters)"
              ]
            }

### Delete a comment [DELETE /api/v1/comments/{id}]

+ Parameters
    + id: `2` (number, required)

+ Request destroy comment
**DELETE**&nbsp;&nbsp;`/api/v1/comments/2`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "deleted": true
            }

+ Request not destroy comment
**DELETE**&nbsp;&nbsp;`/api/v1/comments/3`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body



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
              "email": "simonne@swiftvonrueden.net",
              "password": "test_pswd"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "wfXOE/gGl40USD+ZIUBwwspPQ0O2W1skKV8MV1O3YgeLiCXMv7v4M0ehxa/yahHnendd78tygWHBLYRGL6/x2w=="
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
            Content-Type: application/json

    + Body

            {
              "project": {
                "name": "dicta"
              }
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "5",
                "type": "project",
                "attributes": {
                  "id": 5,
                  "name": "dicta"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "8",
                      "type": "user"
                    }
                  }
                }
              }
            }

+ Request create project with wrong params
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "project": {
                "name": ""
              }
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "name": [
                "can't be blank"
              ]
            }

### Update a project [PUT /api/v1/projects/{id}]

+ Parameters
    + id: `6` (number, required)

+ Request updates project
**PUT**&nbsp;&nbsp;`/api/v1/projects/6`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "project": {
                "name": "est"
              }
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "6",
                "type": "project",
                "attributes": {
                  "id": 6,
                  "name": "est"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "10",
                      "type": "user"
                    }
                  }
                }
              }
            }

+ Request update project with wrong params
**PUT**&nbsp;&nbsp;`/api/v1/projects/7`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "project": {
                "name": ""
              }
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "name": [
                "can't be blank"
              ]
            }

+ Request project does not exist
**PUT**&nbsp;&nbsp;`/api/v1/projects/0`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "project": {
                "name": "test"
              }
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "project": false
            }

### Delete a project [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `9` (number, required)

+ Request deletes project
**DELETE**&nbsp;&nbsp;`/api/v1/projects/9`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "deleted": true
            }

+ Request error deleting project
**DELETE**&nbsp;&nbsp;`/api/v1/projects/10`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "project": {
                "name": "quia"
              }
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body



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
              "csrf": "VoY6DbKZ7fRgE2hafjOfZjx+5vsOQYDe1WvXUL3y63BS9dVNG6eJsJ7TmBb1XDe1ZFUsDC+CotcWxMXC6IHt1Q==",
              "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1ODAyMjc2NTQsInVzZXJfaWQiOjE1LCJ1aWQiOiIyNzExYTFkZi1mYTAyLTRmNjItOWVlYy1lMTM1NzlmM2FjOTAiLCJleHAiOjE1ODAyMjc2NTR9.YHfqTZh7saYzmNp1fA33l31aVHKHmKXPZkdt53h_Pg0",
              "access_expires_at": "2020-01-28T18:07:34.000+02:00",
              "refresh": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1ODAyMjc2NTQsInVpZCI6IjcyYzJmYmJmLTZiMmUtNGNmOS1iZjk4LTE0MTI1OGNhYWMxMiIsImV4cCI6MTU4MDgyODg1NH0.wgmNWzzLr87wd1JeUSNlRkiUKTw9s0IlKKOVx4WApZg",
              "refresh_expires_at": "2020-02-04T17:07:34.000+02:00"
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

# Group Tasks


## Tasks [/tasks]


### Create a task [POST /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `11` (number, required)

+ Request creates a new task
**POST**&nbsp;&nbsp;`/api/v1/projects/11/tasks`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "task": {
                "name": "Task 5",
                "deadline": "2025-01-28T15:07:34.193Z",
                "completed": false,
                "project_id": 11
              }
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "5",
                "type": "task",
                "attributes": {
                  "name": "Task 5",
                  "deadline": "2025-01-28T15:07:34.193Z",
                  "position": 1,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "11",
                      "type": "project"
                    }
                  }
                }
              }
            }

+ Request create task with wrong params
**POST**&nbsp;&nbsp;`/api/v1/projects/12/tasks`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": ""
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "project": [
                "must exist"
              ],
              "name": [
                "can't be blank"
              ]
            }

### Update a task [PUT /api/v1/tasks/{id}]

+ Parameters
    + id: `6` (number, required)

+ Request updates task
**PUT**&nbsp;&nbsp;`/api/v1/tasks/6`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "task": {
                "name": "Task 7",
                "deadline": "2028-01-28T15:07:34.338Z",
                "completed": false,
                "project_id": 13
              }
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "6",
                "type": "task",
                "attributes": {
                  "name": "Task 7",
                  "deadline": "2028-01-28T15:07:34.338Z",
                  "position": 1,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "13",
                      "type": "project"
                    }
                  }
                }
              }
            }

+ Request update task with wrong params
**PUT**&nbsp;&nbsp;`/api/v1/tasks/7`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": ""
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "name": [
                "can't be blank"
              ]
            }

+ Request task does not exist
**PUT**&nbsp;&nbsp;`/api/v1/tasks/0`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "task": {
                "name": "Task 9",
                "deadline": "2026-01-28T15:07:34.465Z",
                "completed": false,
                "project_id": 15
              }
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "task": false
            }

+ Request moved to up
**PUT**&nbsp;&nbsp;`/api/v1/tasks/9`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "task": {
                "name": "Task 13",
                "deadline": "2029-01-28T15:07:34.569Z",
                "completed": false,
                "project_id": 16
              },
              "position": "up"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "9",
                "type": "task",
                "attributes": {
                  "name": "Task 11",
                  "deadline": "2028-01-28T15:07:34.538Z",
                  "position": 1,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "16",
                      "type": "project"
                    }
                  }
                }
              }
            }

+ Request moved to down
**PUT**&nbsp;&nbsp;`/api/v1/tasks/12`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "task": {
                "name": "Task 17",
                "deadline": "2030-01-28T15:07:34.727Z",
                "completed": false,
                "project_id": 17
              },
              "position": "down"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "12",
                "type": "task",
                "attributes": {
                  "name": "Task 15",
                  "deadline": "2025-01-28T15:07:34.694Z",
                  "position": 3,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "17",
                      "type": "project"
                    }
                  }
                }
              }
            }

### Delete a task [DELETE /api/v1/tasks/{id}]

+ Parameters
    + id: `14` (number, required)

+ Request deletes task
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/14`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "task": {
                "name": "Task 19",
                "deadline": "2026-01-28T15:07:34.833Z",
                "completed": false,
                "project_id": 18
              }
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "deleted": true
            }

+ Request delete task with wrong params
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/15`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "task": {
                "name": "Task 21",
                "deadline": "2023-01-28T15:07:34.910Z",
                "completed": false,
                "project_id": 19
              }
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body


