## Atjes Backend
This is the backend server for the Atjes project. It is a RESTful API that provides endpoints for the frontend to interact with the database.

## How to run

1. Clone the repository
2. Make sure you have the following installed:
   * Java 21 
   * Maven
3. Copy over the api-spec to the `open-api/atjes-spec` folder
4. Run the following command in the root directory of the project:
   ```bash
   mvn clean install
   ```
   * This will generate the classes from the openapi spec
5. If you wan to run it without IDE use the following command
    ```bash
   mvn spring-boot:run
   ```
