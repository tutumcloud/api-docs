# Errors

The Tutum API uses the following error codes:


Error Code | Meaning
---------- | -------
400 | Bad Request -- There's a problem in the content of your request. Retrying the same request will fail.
401 | Unauthorized -- Your API key is wrong or your account has been deactivated.
404 | Not Found -- The requested object cannot be found.
405 | Method Not Allowed -- The endpoint requested does not implement the method sent.
429 | Too Many Requests -- You are being throttled because of too many requests in a short period of time.
500 | Internal Server Error -- There was a server error while processing your request. Try again later, or contact support.
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.