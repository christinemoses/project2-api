
# User authentication

## Register

```
curl --include --request POST --header "Content-Type: application/json" -d '{
  "credentials": {
    "email": "an@example.email",
    "password": "an example password",
    "password_confirmation": "an example password"
  }
}' http://localhost:3000/register
```

## Login

```
curl --request POST --header "Content-Type: application/json" -d '{
  "credentials": {
    "email": "cm1@cm1.com",
    "password": "abc123"
  }
}' http://localhost:3000/login
```

## Logout

```
curl --request DELETE --header "Authorization: Token token=7af36b791fdd935dabbad6eebc1a7c2d" http://localhost:3000/logout/2
```

# Users

## List

```
curl --header "Authorization: Token token=7af36b791fdd935dabbad6eebc1a7c2d" http://localhost:3000/users
```

# Holidays

## List

```
curl --header "Authorization: Token token=7af36b791fdd935dabbad6eebc1a7c2d" http://localhost:3000/holidays
```

**OR**

```
curl http://localhost:3000/holidays
```

## Create

```
curl --request POST --header "Authorization: Token token=7af36b791fdd935dabbad6eebc1a7c2d" --header "Content-Type: application/json" -d '{"holiday": {"name":"Christmas"}}' http://localhost:3000/holidays
```
