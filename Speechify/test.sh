token=$(cat token.txt)
curl -H "Host: audio.api.speechify.com" -H "Accept: */*" -H "baggage: sentry-environment=production,sentry-public_key=a7499fe6f6a04454aef2a4403169c864,sentry-release=com.cliffweitzman.speechifyMobile2%403.1.8%2B113,sentry-trace_id=e26982f0c35f4caaa002a799e7e20f29" -H "Authorization: $token" -H "x-speechify-client: iOS" -H "Accept-Language: en-GB,en-US;q=0.9,en;q=0.8" -H "sentry-trace: e26982f0c35f4caaa002a799e7e20f29-44bde1b7c6ec44a7-0" -H "Content-Type: application/json" -H "User-Agent: Speechify/113 CFNetwork/1496.0.7 Darwin/23.5.0" -H "x-speechify-client-version: 3.1.8" --data-binary "{\"ssml\":\"<speak>3. My past does not determine my future.</speak>\",\"voice\":{\"name\":\"kristy\",\"engine\":\"speechify\",\"language\":\"en-US\"},\"forcedAudioFormat\":\"mp3\"}" --HTTP1.1 --compressed "https://audio.api.speechify.com/v1/synthesis/get" -o test.mp3