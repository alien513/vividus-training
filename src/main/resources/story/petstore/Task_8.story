Meta:
    @group PetStore

Scenario: Verify that allows creating a User
Given request body:
{
  "id": 0,
  "username": "OlenaKa",
  "firstName": "Olena",
  "lastName": "Kap",
  "email": "olena@email.com",
  "password": "12345",
  "phone": "12345",
  "userStatus": 0
}
When I set request headers:
|name			|value			 |
|accept			|application/json|
|Content-Type	|application/json|
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/user` 
Then `${response-code}` is equal to `200`
When I save JSON element from `${response}` by JSON path `$..message` to STORY variable `userId`

Scenario: Verify that allows login as a User
When I set request headers:
|name			|value			 |
|accept			|application/json|
|Content-Type	|application/json|
When I execute HTTP GET request for resource with URL `https://petstore.swagger.io/v2/user/login?username=OlenaKa&password=12345` 
Then `${response-code}` is equal to `200`

Scenario: Verify that allows adding a new Pet
Given request body:
{
  "id": 0,
  "category": {
    "id": 0,
    "name": "string"
  },
  "name": "doggie",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
}
When I set request headers:
|name			|value			 |
|accept			|application/json|
|Content-Type	|application/json|
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/pet` 
Then `${response-code}` is equal to `200`
When I save JSON element from `${response}` by JSON path `$.id` to STORY variable `petId`

Scenario: Verify that allows updating Pet name and status
Given request body:
{
  "id": ${petId},
  "category": {
    "id": 0,
    "name": "string"
  },
  "name": "test",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
}
When I set request headers:
|name			|value			 |
|accept			|application/json|
|Content-Type	|application/json|
When I execute HTTP PUT request for resource with URL `https://petstore.swagger.io/v2/pet` 
Then `${response-code}` is equal to `200`

Scenario: Verify that allows deleting Pet
When I set request headers:
|name			|value			 |
|accept			|application/json|
|Content-Type	|application/json|
When I execute HTTP DELETE request for resource with URL `https://petstore.swagger.io/v2/pet/${petId}` 
Then `${response-code}` is equal to `200`