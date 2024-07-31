# blog_server

This is the starting point for your Serverpod server.

To run your server, you first need to start Postgres and Redis. It's easiest to do with Docker.

    docker compose up --build --detach

Then you can start the Serverpod server.

    serverpod generate

    dart bin/main.dart --apply-migrations

    dart bin/main.dart --apply-repair-migration

Update Database

    serverpod create-migration


When you are finished, you can shut down Serverpod with `Ctrl-C`, then stop Postgres and Redis.

    docker compose stop
