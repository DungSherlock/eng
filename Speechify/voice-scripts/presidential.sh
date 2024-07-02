#!/bin/bash
# rootDir=
token=$(cat $(dirname "$0")/../token.txt)
voice=$(basename "$0" .sh)

while IFS='|' read -r text fileName || [ -n "$text" ]; do
  echo ${text[@]} ${fileName[@]}
  curl -sH "Host: audio.api.speechify.com" -H "Accept: */*" -H "baggage: sentry-environment=production,sentry-public_key=a7499fe6f6a04454aef2a4403169c864,sentry-release=com.cliffweitzman.speechifyMobile2%403.1.8%2B113,sentry-trace_id=e26982f0c35f4caaa002a799e7e20f29" -H "Authorization: $token" -H "x-speechify-client: iOS" -H "Accept-Language: en-GB,en-US;q=0.9,en;q=0.8" -H "sentry-trace: e26982f0c35f4caaa002a799e7e20f29-44bde1b7c6ec44a7-0" -H "Content-Type: application/json" -H "User-Agent: Speechify/113 CFNetwork/1496.0.7 Darwin/23.5.0" -H "x-speechify-client-version: 3.1.8" --data-binary "{\"ssml\":\"<speak>$text</speak>\",\"voice\":{\"name\":\"$voice\",\"engine\":\"speechify\",\"language\":\"en-US\"},\"forcedAudioFormat\":\"mp3\"}" --compressed "https://audio.api.speechify.com/v1/synthesis/get" -o $(dirname "$0")/../output/$fileName"-"$voice".mp3"
done < $(dirname "$0")/../input.txt

