api-docs
========

Tutum API documentation available at [https://docs.tutum.co/v2/api](https://docs.tutum.co/v2/api)

If you find a typo or mismatch between the API and this documentation, please send us a pull request!


## Usage

To run it locally:

	docker build -t tutum/api-docs .
	docker run -p 4567:4567 tutum/api-docs

The documentation will be available in http://localhost:4567/


## Publishing

(Only authorized users)

To publish, run the following:

	docker run -i -t -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY tutum/api-docs publish.sh

With appropiate credentials in `$AWS_ACCESS_KEY_ID` and `$AWS_SECRET_ACCESS_KEY`.
