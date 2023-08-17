Apache Fineract: A Platform for Microfinance
============

**NOTE: This repository is used for BreakFree purposes to test LangChain Agents only. It is fixed at the v1.8.4 and includes several breaking changes to the official product. This includes missing Cucumber features and changes to configuration.** 

Refer to the Apache Fineract GitHub page for the full project **and** to dive deeper into documentation and code.

- [Apache Fineract on GitHub](https://github.com/apache/fineract/).

Fineract is a mature platform with open APIs that provides a reliable, robust, and affordable core banking solution for financial institutions offering services to the world’s 3 billion underbanked and unbanked.


Requirements
============
* Java >= 17 (OpenJDK JVM is tested by our CI on Travis)
* MariaDB 10.6

You can run the required version of the database server in a container, instead of having to install it, like this:

    docker run --name mariadb-10.8 -p 3306:3306 -e MARIADB_ROOT_PASSWORD=mysql -d mariadb:10.8

and stop and destroy it like this:

    docker rm -f mariadb-10.8

Beware that this database container database keeps its state inside the container and not on the host filesystem.  It is lost when you destroy (rm) this container.  This is typically fine for development.  See [Caveats: Where to Store Data on the database container documentation](https://hub.docker.com/_/mariadb) re. how to make it persistent instead of ephemeral.

Tomcat v9 is only required if you wish to deploy the Fineract WAR to a separate external servlet container.  Note that you do not require to install Tomcat to develop Fineract, or to run it in production if you use the self-contained JAR, which transparently embeds a servlet container using Spring Boot.  (Until FINERACT-730, Tomcat 7/8 were also supported, but now Tomcat 9 is required.)


Instructions to execute Integration Tests
============
> Note that if this is the first time to access MySQL DB, then you may need to reset your password.

Run the following commands, very similarly to how [.travis.yml](.travis.yml) does:
1. `./gradlew createDB -PdbName=fineract_tenants`
1. `./gradlew createDB -PdbName=fineract_default`
1. `./gradlew clean test`


Pull Requests
-------------
To make a pull request to this repository, create a new branch, make changes there, and then submit a pull request. Nil approval is required so long as you have access to this repository.
