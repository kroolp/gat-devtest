# DevTest Project

## Usage

Rails defaults

- setup: `bin/setup`
- running: `bin/rails s`
- tests: `bin/rspec`

## Authorization

To make a request in private area (`/api/v1/private`) you need to put `auth_token` to Authorization Header (`Authorization: Token token="auth_token"`).

You can receive it by calling to `api/v1/sessions` endpoint and sending `email` and `password` in params.

In development environment you can use the user from seeds.

# Endpoints
### POST /api/v1/sessions
params:
- email
- password

### GET /api/v1/locations/#{country_code}
### GET /api/v1/target_groups/#{country_code}
### GET /api/v1/private/locations/#{country_code}
### GET /api/v1/private/target_groups/#{country_code}
### POST /api/v1/private/evaluate_target
params:
- country_code
- target_group_id
- locations: array of { id: integer, panel_size: integer }
