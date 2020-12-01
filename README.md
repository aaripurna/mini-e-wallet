# README

The web framework is Ruby on Rails

to run this, first create `.env`with this data bellow:
```env
DATABASE_USERNAME=
DATABASE_ PASSWORD=
RAILS_MASTER_KEY=
```

to generate `RAILS_MASTER_KEY` run 
```sh
rails secret
```

then run the folowing
```sh
bundle install
rails db:setup
```

to run the server
```sh
rails s
```

the server will run in port 3000

## API Docs

#### Login
```sh
curl --request POST \
  --url http://localhost:3000/auth/login \
  --header 'Content-Type: application/json' \
  --data '{
	"login": "nawa@example.com",
	"password": "1234lima"
}'
```

#### Sign Up
```sh
curl --request POST \
  --url http://localhost:3000/signup \
  --header 'Content-Type: application/json' \
  --data '{
	"username": "nawaaa",
	"email": "nawaa@example.com",
	"password": "password"
}'
```

#### Log Out
```sh
curl --request DELETE \
  --url http://localhost:3000/auth/logout \
  --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2MDY4MjAxMjZ9.2dsLJRhrVNdB1L0jrrPYGRfjyC9oJqmPyvVrbsymcaE'
```

#### Topup
```sh
curl --request POST \
  --url http://localhost:3000/balances/topup \
  --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2MDY4NjEzMzh9.piVmPupsW0OEHgyBXdZ3D-PPRhQ5iP0MqAX6Lcb4VEY' \
  --header 'Content-Type: application/json' \
  --data '{
	"balance" : {
		"amount": 200
	}
}'
```

#### Transfer
```sh
curl --request POST \
  --url http://localhost:3000/balances/transfer \
  --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2MDY4NjEzMzh9.piVmPupsW0OEHgyBXdZ3D-PPRhQ5iP0MqAX6Lcb4VEY' \
  --header 'Content-Type: application/json' \
  --data '{
	"balance": {
		"amount": 700,
		"receiver_id": 2
	}
}'
```

#### Current Balance
```sh
curl --request GET \
  --url http://localhost:3000/balances \
  --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2MDY4NjEzMzh9.piVmPupsW0OEHgyBXdZ3D-PPRhQ5iP0MqAX6Lcb4VEY'
```

#### Histories
```sh
curl --request GET \
  --url http://localhost:3000/balances/histories \
  --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2MDY4NjEzMzh9.piVmPupsW0OEHgyBXdZ3D-PPRhQ5iP0MqAX6Lcb4VEY'
```


