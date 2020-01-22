

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
              "email": "twilakertzmann@dubuque.io",
              "password": "test_pswd"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "mjtcQ3o1NogUrh8gACGjUwsbE9+cHIzUM33ecOeVaUXBluOakx/QUKQEmh6FSLRml+xSNyq+a5iQUbRMcWitCQ=="
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
                "name": "alias"
              }
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2729",
                "type": "project",
                "attributes": {
                  "id": 2729,
                  "name": "alias"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "3925",
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
    + id: `2730` (number, required)

+ Request updates project
**PUT**&nbsp;&nbsp;`/api/v1/projects/2730`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "project": {
                "name": "aspernatur"
              }
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2730",
                "type": "project",
                "attributes": {
                  "id": 2730,
                  "name": "aspernatur"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "3927",
                      "type": "user"
                    }
                  }
                }
              }
            }

+ Request update project with wrong params
**PUT**&nbsp;&nbsp;`/api/v1/projects/2731`

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
    + id: `2733` (number, required)

+ Request deletes project
**DELETE**&nbsp;&nbsp;`/api/v1/projects/2733`

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
**DELETE**&nbsp;&nbsp;`/api/v1/projects/2734`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "project": {
                "name": "et"
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
              "csrf": "vB3dCVUSf+pty4iy+4polVk/uFelnj9Qh/dVRG5HZFWTBaFMHfa2yBuY4PYsv3HxpuqD+G/4mNMNGo0SKoZKhg==",
              "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1Nzk3MTI0NTYsInVzZXJfaWQiOjM5MzIsInVpZCI6IjJhZTJhM2JjLTI4ODYtNGNkZC04ZGNkLTAzMzQ1M2YwN2YyZCIsImV4cCI6MTU3OTcxMjQ1Nn0.ug3wx8j0B-t76IbjRAXzAZStCAKQMdMYw-vZBKRH2B0",
              "access_expires_at": "2020-01-22T19:00:56.000+02:00",
              "refresh": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1Nzk3MTI0NTYsInVpZCI6IjcwNTZmNDcyLTFmMDItNDIxNy05ZjYzLTBmMTFkNjQ5MDQ2MCIsImV4cCI6MTU4MDMxMzY1Nn0.eLOQs6K4WImEQ_Ze25u-FRSjRWf6cCQxdjMsVPmro_s",
              "refresh_expires_at": "2020-01-29T18:00:56.000+02:00"
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


### Create a task [POST /api/v1/tasks]


+ Request creates a new task
**POST**&nbsp;&nbsp;`/api/v1/tasks`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "task": {
                "name": "Task 1",
                "deadline": "2021-01-22T16:00:56.733Z",
                "completed": false,
                "project_id": 2735
              }
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1672",
                "type": "task",
                "attributes": {
                  "name": "Task 1",
                  "deadline": "2021-01-22T16:00:56.733Z",
                  "position": 1,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "2735",
                      "type": "project"
                    }
                  }
                }
              }
            }

+ Request create task with wrong params
**POST**&nbsp;&nbsp;`/api/v1/tasks`

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
    + id: `1673` (number, required)

+ Request updates task
**PUT**&nbsp;&nbsp;`/api/v1/tasks/1673`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "task": {
                "name": "Task 3",
                "deadline": "2022-01-22T16:00:56.898Z",
                "completed": false,
                "project_id": 2736
              }
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1673",
                "type": "task",
                "attributes": {
                  "name": "Task 3",
                  "deadline": "2022-01-22T16:00:56.898Z",
                  "position": 1,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "2736",
                      "type": "project"
                    }
                  }
                }
              }
            }

+ Request update task with wrong params
**PUT**&nbsp;&nbsp;`/api/v1/tasks/1674`

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
                "name": "Task 5",
                "deadline": "2030-01-22T16:00:57.029Z",
                "completed": false,
                "project_id": 2738
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
**PUT**&nbsp;&nbsp;`/api/v1/tasks/1676`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "task": {
                "name": "Task 9",
                "deadline": "2026-01-22T16:00:57.142Z",
                "completed": false,
                "project_id": 2739
              },
              "position": "up"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1676",
                "type": "task",
                "attributes": {
                  "name": "Task 7",
                  "deadline": "2021-01-22T16:00:57.110Z",
                  "position": 1,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "2739",
                      "type": "project"
                    }
                  }
                }
              }
            }

+ Request moved to down
**PUT**&nbsp;&nbsp;`/api/v1/tasks/1679`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "task": {
                "name": "Task 13",
                "deadline": "2028-01-22T16:00:57.275Z",
                "completed": false,
                "project_id": 2740
              },
              "position": "down"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1679",
                "type": "task",
                "attributes": {
                  "name": "Task 11",
                  "deadline": "2027-01-22T16:00:57.245Z",
                  "position": 3,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "2740",
                      "type": "project"
                    }
                  }
                }
              }
            }

### Delete a task [DELETE /api/v1/tasks/{id}]

+ Parameters
    + id: `1681` (number, required)

+ Request deletes task
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/1681`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "task": {
                "name": "Task 15",
                "deadline": "2028-01-22T16:00:57.385Z",
                "completed": false,
                "project_id": 2741
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
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/1682`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "task": {
                "name": "Task 17",
                "deadline": "2030-01-22T16:00:57.470Z",
                "completed": false,
                "project_id": 2742
              }
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body


