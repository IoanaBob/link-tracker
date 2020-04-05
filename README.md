# link-tracker
Application creates email tracking links, which when embedded into an email, track if they were opened.

## Setup
### With Docker
- Start containers: `docker-compose up --build`
- Exec into container: `docker exec -it link-tracker_web_1 bash`

Set up inside container:
```
# create and migrate database
rake db:create
rake db:migrate

# run tests
rspec
```

### Locally
Dependencies
- Ruby version: 2.7.1
- Postgres

Install the gems
```
bundle
```

Create and migrate the DB
```
rake db:create
rake db:migrate
```

Run the tests
```
bundle exec rspec
```

Start the server
```
rails s
```

### API
Server: Local access at `http://localhost:3000/`

Route `POST api/tracking_links` creates a tracking link for a given message.
Usage: Should be called before sending an email. Embed the link in the response into the email.
Query params:
- `message_id` (required)
- `recipient_email`
- `subject`
- `user_id`

Example request body:
```
{
  message_id: "ABC123",
  email: email,
  recipient_email: recipient_email,
  subject: "blabla"
}
```

-----------
Route `GET api/tracked_action/opened/:message_id` logs that the user has opened an email.
Params:
- `message_id` - emails are identifiable by unique RFC822 message-ids

#### Manual test
If you use Postman, you can import the collection in this repo (link-tracker.postman_collection.json) and test the endpoints yourself.