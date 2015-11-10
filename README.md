
# User authentication

## Register

```
curl --include --request POST --header "Content-Type: application/json" -d '{
  "credentials": {
    "email": "aaa@aaa.com",
    "password": "abc123",
    "password_confirmation": "abc123"
  }
}' http://localhost:3000/register
```

## Login

```
curl --request POST --header "Content-Type: application/json" -d '{
  "credentials": {
    "email": "aaa@aaa.com",
    "password": "abc123"
  }
}' http://localhost:3000/login
```

## Logout

```
curl --request DELETE --header "Authorization: Token token=3e6d67156572e62956e3158c9e58fc72" http://localhost:3000/logout/2
```

# Holidays

## List

```
curl --header "Authorization: Token token=3e6d67156572e62956e3158c9e58fc72" http://localhost:3000/holidays
```

## Create

```
curl --request POST --header "Authorization: Token token=3e6d67156572e62956e3158c9e58fc72" --header "Content-Type: application/json" -d '{"holiday": {"name":"Christmas"}}' http://localhost:3000/holidays
```
# Recipients

## List

```
curl --header "Authorization: Token token=3e6d67156572e62956e3158c9e58fc72" http://localhost:3000/holidays/1/recipients
```
## Create

```
curl --request POST --header "Authorization: Token token=3e6d67156572e62956e3158c9e58fc72" --header "Content-Type: application/json" -d '{"recipient": {"name":"Gabe"}}' http://localhost:3000/holidays/1/recipients
```
# Gift Ideas

## List

```
curl --header "Authorization: Token token=3e6d67156572e62956e3158c9e58fc72" http://localhost:3000/holidays/1/recipients/1/gift_ideas
```
## Create

```
curl --request POST --header "Authorization: Token token=3e6d67156572e62956e3158c9e58fc72" --header "Content-Type: application/json" -d '{"gift_idea": {"description":"Giant box of Legos"}}' http://localhost:3000/holidays/1/recipients/1/gift_ideas
```

