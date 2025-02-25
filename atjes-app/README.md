#  Atjes App

Demo App to show OpenAPI Generator Magic

## Generate the OpenAPI Client Code

Run:

    openapi-generator generate -i atjes-spec/atjes-api-spec.yaml -c ./config.json -g swift5 -o AtjesApiClient

The OpenAPI Client is added to this project as a local SPM dependency, located in `AtjesApiClient`.
