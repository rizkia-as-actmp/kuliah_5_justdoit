ping:
	curl -X GET http://127.0.0.1:8090/hello 

registeruser:
	curl -X POST http://127.0.0.1:8090/api/collections/users/records \
		-H "Content-Type: application/json" \
		-d '{"email": "rizkia.as.pac@gmail.com", "name" : "rizkia", "password": "21204444", "passwordConfirm" : "21204444"}'

reqveri:
	curl -X POST http://127.0.0.1:8090/api/collections/users/request-verification \
		-H "Content-Type: application/json" \
		-d '{"email": "rizkia.as.pac@gmail.com"}'

login:
	curl -X POST http://localhost:8090/api/collections/users/auth-with-password \
		-H "Content-Type: application/json" \
		-d '{"identity": "rizkia.as.pac@gmail.com", "password": "21204444"}'

passotp:
	curl -X POST http://localhost:8090/api/collections/users/auth-with-otp \
		-H "Content-Type: application/json" \
		-d '{"otpId": "apu0m0548t39o70", "password": "4392"}' 

authrefresh:
	curl -X POST http://127.0.0.1:8090/api/collections/users/auth-refresh \
		-H "Authorization: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb2xsZWN0aW9uSWQiOiJfcGJfdXNlcnNfYXV0aF8iLCJleHAiOjE3MzQxNjE2MDUsImlkIjoiM2U3a2M1cnBqd3Q0MjgzIiwicmVmcmVzaGFibGUiOnRydWUsInR5cGUiOiJhdXRoIn0.4g-FtjLvoeDsNhSsbbgprNjhUR79JKdh3Owaoxezju0" \
		-H "Content-Type: application/json"


authrefresh2:
	curl -X POST http://127.0.0.1:8090/api/collections/users/auth-refresh \
		-H "Authorization: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb2xsZWN0aW9uSWQiOiJfcGJfdXNlcnNfYXV0aF8iLCJleHAiOjE3MzM1NTgyMjUsImlkIjoiM2U3a2M1cnBqd3Q0MjgzIiwicmVmcmVzaGFibGUiOnRydWUsInR5cGUiOiJhdXRoIn0.rzMw2RiWF5uakg7DjdydzRKWrr50zX40Lk_uj4RB_GY" \
		-H "Content-Type: application/json"

reqotp:
	curl -X POST http://localhost:8090/api/collections/users/request-otp \
		-H "Content-Type: application/json" \
		-d '{"email": "rizkia.as.pac@gmail.com"}'

conver:
	curl -X GET http://127.0.0.1:8090/api/collections/users/confirm-verification/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb2xsZWN0aW9uSWQiOiJfcGJfdXNlcnNfYXV0aF8iLCJlbWFpbCI6InJpemtpYS5hcy5wYWNAZ21haWwuY29tIiwiZXhwIjoxNzMyNzEzMTMyLCJpZCI6InF2cDIwb3E2eGt2MDUzdCIsInR5cGUiOiJ2ZXJpZmljYXRpb24ifQ.PEj6tSF-j6aYDtEGvAqimrYqv1BbNFZA7vehlrtc7BE \
