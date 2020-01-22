

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
              "email": "ethankunze@ruecker.name",
              "password": "test_pswd"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "bYpFIVFYI3Zt4difs0AaQR4myKsdV1gC/bT5VNl85+kzC5I/XrT1V/0tQZvbcoC5+AdNcKHCLwLDLrbBm4ZL9Q=="
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
                "name": "laudantium"
              }
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1",
                "type": "project",
                "attributes": {
                  "id": 1,
                  "name": "laudantium"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "4",
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
    + id: `2` (number, required)

+ Request updates project
**PUT**&nbsp;&nbsp;`/api/v1/projects/2`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "project": {
                "name": "facere"
              }
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2",
                "type": "project",
                "attributes": {
                  "id": 2,
                  "name": "facere"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "6",
                      "type": "user"
                    }
                  }
                }
              }
            }

+ Request update project with wrong params
**PUT**&nbsp;&nbsp;`/api/v1/projects/3`

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
    + id: `5` (number, required)

+ Request deletes project
**DELETE**&nbsp;&nbsp;`/api/v1/projects/5`

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
**DELETE**&nbsp;&nbsp;`/api/v1/projects/6`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "project": {
                "name": "quas"
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
              "csrf": "ZDJmIz0r6rbMNCdTJZKL9E47Xvx5eFio2onNa1LHUIVU3mParijfDJOJYfqTzlC1KhGafZGObyKgL5IKHecIkA==",
              "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1Nzk3MTMzMTcsInVzZXJfaWQiOjExLCJ1aWQiOiI0MjhhZWI2ZS1lYTk3LTQ3ZjUtODY0ZS03YTc0ODQyNjAxZmIiLCJleHAiOjE1Nzk3MTMzMTd9.aXwe-wPtI5QN35mFNbLqE-0itpKt5Q0c0dku4tfkAoU",
              "access_expires_at": "2020-01-22T19:15:17.000+02:00",
              "refresh": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1Nzk3MTMzMTcsInVpZCI6ImQ1ZGQzYTBhLWFhOGQtNDgxNC1hMGFjLTM1ZDEzYTk0YzFiMiIsImV4cCI6MTU4MDMxNDUxN30.GliXG39oAuuqQ8qXJAQuNxUaxqmyQ47bkIwPAQOvaq4",
              "refresh_expires_at": "2020-01-29T18:15:17.000+02:00"
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
                "deadline": "2023-01-22T16:15:17.470Z",
                "completed": false,
                "project_id": 7
              }
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1",
                "type": "task",
                "attributes": {
                  "name": "Task 1",
                  "deadline": "2023-01-22T16:15:17.470Z",
                  "position": 1,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "7",
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
    + id: `2` (number, required)

+ Request updates task
**PUT**&nbsp;&nbsp;`/api/v1/tasks/2`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "task": {
                "name": "Task 3",
                "deadline": "2024-01-22T16:15:17.648Z",
                "completed": false,
                "project_id": 8
              }
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2",
                "type": "task",
                "attributes": {
                  "name": "Task 3",
                  "deadline": "2024-01-22T16:15:17.648Z",
                  "position": 1,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "8",
                      "type": "project"
                    }
                  }
                }
              }
            }

+ Request update task with wrong params
**PUT**&nbsp;&nbsp;`/api/v1/tasks/3`

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
                "deadline": "2028-01-22T16:15:17.775Z",
                "completed": false,
                "project_id": 10
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
**PUT**&nbsp;&nbsp;`/api/v1/tasks/5`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "task": {
                "name": "Task 9",
                "deadline": "2030-01-22T16:15:17.883Z",
                "completed": false,
                "project_id": 11
              },
              "position": "up"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "5",
                "type": "task",
                "attributes": {
                  "name": "Task 7",
                  "deadline": "2023-01-22T16:15:17.849Z",
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

+ Request moved to down
**PUT**&nbsp;&nbsp;`/api/v1/tasks/8`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "task": {
                "name": "Task 13",
                "deadline": "2028-01-22T16:15:18.032Z",
                "completed": false,
                "project_id": 12
              },
              "position": "down"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "8",
                "type": "task",
                "attributes": {
                  "name": "Task 11",
                  "deadline": "2028-01-22T16:15:18.000Z",
                  "position": 3,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "12",
                      "type": "project"
                    }
                  }
                }
              }
            }

### Delete a task [DELETE /api/v1/tasks/{id}]

+ Parameters
    + id: `10` (number, required)

+ Request deletes task
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/10`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "task": {
                "name": "Task 15",
                "deadline": "2026-01-22T16:15:18.148Z",
                "completed": false,
                "project_id": 13
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
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/11`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "task": {
                "name": "Task 17",
                "deadline": "2022-01-22T16:15:18.231Z",
                "completed": false,
                "project_id": 14
              }
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body


