# Setup Guide

[API Docs](#api-docs)

[Testing](#testing)

### Clone the repo:

```
git clone https://github.com/atasker/cat-pic-api.git
```

### cd into new directory:

```
cd cat-pic-api
```

### Create database and run migrations:

```
rails db:create db:migrate
```

### Your local environment is now setup to use the API on your localhost.

# API Docs

**Note:** *Make sure to start your local server with* `rails server`

### ENDPOINTS:

#### ![#c5f015](https://via.placeholder.com/15/c5f015/000000?text=+) GET /catpics

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

#### ![#c5f015](https://via.placeholder.com/15/c5f015/000000?text=+) GET /catpics/:id

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

#### ![#1589F0](https://via.placeholder.com/15/1589F0/000000?text=+) PUT /catpics/:id

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

#### ![#f03c15](https://via.placeholder.com/15/f03c15/000000?text=+) DELETE /catpics/:id

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

#### ![#ffff00](https://via.placeholder.com/15/ffff00/000000?text=+) POST /catpics

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

# Testing

#### Files related to testing can be found in the `/spec` folder.
#### The tests can be found in `/spec/requests/catpics_spec.rb`.
#### `/spec/rails_helper.rb` and `spec/spec_helper.rb` contain helper methods and configuration settings.

### To run tests locally:

```
bundle exec rspec
```

![passing tests](https://i.ibb.co/nkZyrNT/Screen-Shot-2020-12-31-at-4-12-22-PM.png)