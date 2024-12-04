ping:
	curl -X GET http://127.0.0.1:8090/hello \


login:
	curl -X POST http://localhost:8090/api/collections/users/auth-with-password \
		-H "Content-Type: application/json" \
		-d '{"identity": "rizkia.as.pac@gmail.com", "password": "21204444"}'

reqotp:
	curl -X POST http://localhost:8090/api/collections/users/request-otp \
		-H "Content-Type: application/json" \
		-d '{"email": "rizkia.as.pac@gmail.com"}'


passotp:
	curl -X POST http://localhost:8090/api/collections/users/auth-with-otp \
		-H "Content-Type: application/json" \
		-d '{"otpId": "4xg40ua3mltj29y", "password": "3328"}'

user:
	curl -X POST http://127.0.0.1:8090/api/collections/users/gecords \
		-H "Content-Type: application/json" \
		-d '{"email": "rizkia.as.pac@gmail.com", "name" : "rizkia", "password": "21204444", "passwordConfirm" : "21204444"}'

veri:
	curl -X POST http://127.0.0.1:8090/api/collections/users/request-verification \
		-H "Content-Type: application/json" \
		-d '{"email": "rizkia.as.pac@gmail.com"}'

conver:
	curl -X GET http://127.0.0.1:8090/api/collections/users/confirm-verification/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb2xsZWN0aW9uSWQiOiJfcGJfdXNlcnNfYXV0aF8iLCJlbWFpbCI6InJpemtpYS5hcy5wYWNAZ21haWwuY29tIiwiZXhwIjoxNzMyNzEzMTMyLCJpZCI6InF2cDIwb3E2eGt2MDUzdCIsInR5cGUiOiJ2ZXJpZmljYXRpb24ifQ.PEj6tSF-j6aYDtEGvAqimrYqv1BbNFZA7vehlrtc7BE \
