# Project Template
A template to start new projects with.

Prerequisites
-------------
1. install Docker
1. install Docker Compose
1. install Git
1. clone repository: `git clone --recursive https://github.com/zhao-lin-li/project_template_with_containers.git`

Getting Started
---------------
1. run bootstrap.sh: `./bootstrap.sh`
1. start service: `docker compose up`

Testing
-------
To test the application:

    app$ scripts/test_app.sh

Linting
-------
To lint the shell scripts:

    $ docker compose run shell-linter
    shell-linter$ scripts/lint_app.sh

    or

    $ docker compose run shell-linter scripts/lint_app.sh

Documenting
-----------
To document the application:

    app$ scripts/document_app.sh

Notes
-----
TBD

