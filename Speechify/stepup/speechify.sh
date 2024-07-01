#!/bin/bash

voice=("john" "presidential" "mrbeast" "snoop" "gwyneth" "nate" "jamie" "bwyneth" "cliff" "mary" "henry" "david" "emma" "kristy" "oliver" "benwilson" "tasha" "joe" "lisa" "george" "emily" "rob" "jessica" "aria" "kyle" "carly" "sally" "simon")

while IFS='|' read -r text fileName || [ -n "$text" ]; do
  echo ${text[@]} ${fileName[@]}
  for item in "${voice[@]}"
  do
    curl -sH "Host: audio.api.speechify.com" -H "Accept: */*" -H "baggage: sentry-environment=production,sentry-public_key=a7499fe6f6a04454aef2a4403169c864,sentry-release=com.cliffweitzman.speechifyMobile2%403.1.8%2B113,sentry-trace_id=e26982f0c35f4caaa002a799e7e20f29" -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJYOHp5M3ZTUHhoVjk0WGVWeXU1cW5CVHcyRWEyIiwid29yZFF1b3RhIjo1MDAwLCJsYXN0V29yZFF1b3RhR3JhbnREYXRlIjoxNzE5NzEyNTU0LCJpYXQiOjE3MTk3MTI1NTQsImV4cCI6MTcxOTc5ODk1NH0.D3R-iLBV4dwh1Oi3DGtuF8YTZbFk3n8qCyDLM090vC4" -H "x-speechify-client: iOS" -H "Accept-Language: en-GB,en-US;q=0.9,en;q=0.8" -H "sentry-trace: e26982f0c35f4caaa002a799e7e20f29-44bde1b7c6ec44a7-0" -H "Content-Type: application/json" -H "User-Agent: Speechify/113 CFNetwork/1496.0.7 Darwin/23.5.0" -H "x-speechify-client-version: 3.1.8" --data-binary "{\"ssml\":\"<speak>$text</speak>\",\"voice\":{\"name\":\"$item\",\"engine\":\"speechify\",\"language\":\"en-US\"},\"forcedAudioFormat\":\"mp3\"}" --compressed "https://audio.api.speechify.com/v1/synthesis/get" -o $fileName"-"$voice".mp3"
  done
done < input.txt

# text="It's a noisy place to live."
# fileName="ngon.mp3"
# param=(-H "Host: audio.api.speechify.com" -H "Accept: */*" -H "baggage: sentry-environment=production,sentry-public_key=a7499fe6f6a04454aef2a4403169c864,sentry-release=com.cliffweitzman.speechifyMobile2%403.1.8%2B113,sentry-trace_id=e26982f0c35f4caaa002a799e7e20f29" -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJYOHp5M3ZTUHhoVjk0WGVWeXU1cW5CVHcyRWEyIiwid29yZFF1b3RhIjo1MDAwLCJsYXN0V29yZFF1b3RhR3JhbnREYXRlIjoxNzE5NzEyNTU0LCJpYXQiOjE3MTk3MTI1NTQsImV4cCI6MTcxOTc5ODk1NH0.D3R-iLBV4dwh1Oi3DGtuF8YTZbFk3n8qCyDLM090vC4" -H "x-speechify-client: iOS" -H "Accept-Language: en-GB,en-US;q=0.9,en;q=0.8" -H "sentry-trace: e26982f0c35f4caaa002a799e7e20f29-44bde1b7c6ec44a7-0" -H "Content-Type: application/json" -H "User-Agent: Speechify/113 CFNetwork/1496.0.7 Darwin/23.5.0" -H "x-speechify-client-version: 3.1.8")

# curl "${param[@]}" --data-binary "{\"ssml\":\"<speak>$text</speak>\",\"voice\":{\"name\":\"kristy\",\"engine\":\"speechify\",\"language\":\"en-US\"},\"forcedAudioFormat\":\"mp3\"}" --compressed "https://audio.api.speechify.com/v1/synthesis/get" -o $fileName


