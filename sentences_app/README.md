# README

## Funtional Demo
- https://share.getcloudapp.com/v1uPKXw6

## Technical Demo
- https://share.getcloudapp.com/OAuowwoY

## Includes
- Dockerized Rails
  - Rails 7
  - Ruby 3.2
  - Postgres
- Service
  - SentenceService
- Models with Migrations
  - Sentence
  - SentencePart
  - EntityType
- Controllers
  - Sentence
  - SentencePart
- Views
  - Index
  - Edit
- Helper
  - SentenceHelper
- Tailwind CSS
- Tests
  - Service
  - Request
  - Views
  - Routes


## Run

```
docker-compose up
```

Open `http://localhost:3000`

## Run tests

Once you have your server running

```
docker-compose exec sentences_app rspec --format=documentation
```

Output
```

SentencesHelper
  #decorate_sentence_part
    manages a part without entity
    manages an entity part

/sentences
  GET /index
    renders a successful response
  DELETE /destroy
    destroys the requested sentence
    redirects to the sentences list

SentencesController
  routing
    routes to #index
    routes to #new
    routes to #edit
    routes to #create
    routes to #update via PUT
    routes to #update via PATCH
    routes to #destroy

SentenceService
  creating a sentence
    saves the sentence
    creates the sentence parts
  setting an entity
    when is a new entity
      creates the entity
      associates the entity
      creates a color
    when is an existent entity
      associates the entity
  resetting the entity
    removes the association

sentences/new
  renders new sentence form

Finished in 0.32438 seconds (files took 1.12 seconds to load)
20 examples, 0 failures
```


