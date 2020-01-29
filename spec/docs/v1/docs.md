

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
                "text": "zwy1djdahi8",
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
                  "text": "zwy1djdahi8",
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
              "email": "dulciemiller@swaniawski.com",
              "password": "test_pswd"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "b+34NvNLxa0UVJU1H/hBPBSUkqIIeR065GC79atfZV3V3Bdrk5fPtHgQtVw+5t2MJDRXh8q8RZCuV2Zd1Y1XYg=="
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
                "name": "natus"
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
                  "name": "natus"
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
                "name": "voluptas"
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
                  "name": "voluptas"
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
                "name": "consequatur"
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
              "csrf": "GakBSF9uqxAs7kGjRwUYwjyZ1LHccjRdTILuvgiv1PZPD7KjW/G/ewIdvw2hF28cBrU+0TqBB0VEUpr7uUX1dQ==",
              "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1ODAyOTM5NTIsInVzZXJfaWQiOjE1LCJ1aWQiOiI4ZDJiOGY0YS02Y2I0LTQ4N2EtYjI3Yy1jODNkYWExMjgzMTAiLCJleHAiOjE1ODAyOTM5NTJ9.TL70VQkssqriLbKidL6noClbDUN3Y29RyoWKwPSHJ94",
              "access_expires_at": "2020-01-29T12:32:32.000+02:00",
              "refresh": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1ODAyOTM5NTIsInVpZCI6IjE0ZTRmYzg4LTVhMGUtNDlmMy05YzllLTc3MzQ2Y2U3MzIzMCIsImV4cCI6MTU4MDg5NTE1Mn0.nJkWdGtFfEa5xsxcc5uQfY8fu3hb7RcZCALgmyofrPY",
              "refresh_expires_at": "2020-02-05T11:32:32.000+02:00"
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
                "deadline": "2028-01-29T09:32:32.255Z",
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
                  "deadline": "2028-01-29T09:32:32.255Z",
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
                "deadline": "2029-01-29T09:32:32.392Z",
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
                  "deadline": "2029-01-29T09:32:32.392Z",
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
                "deadline": "2025-01-29T09:32:32.512Z",
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
                "deadline": "2025-01-29T09:32:32.623Z",
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
                  "deadline": "2025-01-29T09:32:32.591Z",
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
                "deadline": "2021-01-29T09:32:32.771Z",
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
                  "deadline": "2030-01-29T09:32:32.740Z",
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
                "deadline": "2026-01-29T09:32:32.876Z",
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
                "deadline": "2026-01-29T09:32:32.959Z",
                "completed": false,
                "project_id": 19
              }
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body


