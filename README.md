# Setup Guide

[API Docs](#api-docs)

### Clone the repo:

```
git clone https://github.com/atasker/cat-pic-api.git
```

### cd into new directory

```
cd cat-pic-api
```

### Create database and run migrations

```
rails db:create db:migrate
```

### Your local environment is now setup to use the API on your localhost.

# API Docs

### ENDPOINTS

#### GET /catpics

**Curl**

```lang-bash
curl --location --request GET 'localhost:3000/catpics'
```

**Response:**

> Returns all cat pics.
> Status code: 200

```
[
    {
        "id": 1,
        "image": {
            "url": "path/to/cat.jpg"
        },
        "created_at": "2020-12-31T18:45:18.684Z",
        "updated_at": "2020-12-31T18:45:18.684Z"
    },
    {
        "id": 2,
        "image": {
            "url": "path/to/cat.jpg"
        },
        "created_at": "2020-12-31T18:45:21.031Z",
        "updated_at": "2020-12-31T18:45:21.031Z"
    },
    {
        "id": 3,
        "image": {
            "url": "path/to/cat.jpg"
        },
        "created_at": "2020-12-31T18:45:21.926Z",
        "updated_at": "2020-12-31T18:45:21.926Z"
    }
]
```

---

#### GET /catpics/:id

**Curl**

```lang-bash
curl --location --request GET 'localhost:3000/catpics/1'
```

**Response:**

> Returns specific cat pic by id.
> Status code: 200

```
{
    "id": 1,
    "image": {
        "url": "path/to/cat.jpg"
    },
    "created_at": "2020-12-31T18:45:18.684Z",
    "updated_at": "2020-12-31T18:45:18.684Z"
}
```

---

#### PUT /catpics/:id

**Curl**

```lang-bash
curl --location --request PUT 'localhost:3000/catpics/1' \
--form 'image=@"/path/to/image/cat2.jpg"'
```

**Response**

> Updates specified cat pic.
> Status code: 204

```
204 No Content
```

---

#### DELETE /catpics/:id

**Curl**

```lang-bash
curl --location --request DELETE 'localhost:3000/catpics/1'
```

**Response**

> Deletes specified cat pic.
> Status code: 204

```
204 No Content
```

---

#### POST /catpics

**Curl**

```lang-bash
curl --location --request POST 'localhost:3000/catpics' \
--form 'image=@"/path/to/image/cat2.jpg"'
```

**Response**

> Uploads cat pic.
> Status code: 201

```
{
    "id": 4,
    "image": {
        "url": "path/to/cat.jpg"
    },
    "created_at": "2020-12-31T19:28:28.301Z",
    "updated_at": "2020-12-31T19:28:28.301Z"
}
```