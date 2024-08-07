#!/bin/bash

topic_id="110"
lesson_id="1"

onionGPT=`curl -H "Host: tofu.stepup.edu.vn" -H "Accept: application/json" -H "User-Agent: tofuapp/1718872959 CFNetwork/1496.0.7 Darwin/23.5.0" -H "Accept-Language: vi-VN,vi;q=0.9" -H "Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIwOTc5MjczNTA3IiwiYXV0aG9yaXRpZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJfaWQiOjg3OTY1NCwidXNlcm5hbWUiOiJIdeG7hyBExaluZyIsImp0aSI6ImoyR2xNVzZTSTJPM2FiR3hLaE5YV184Nzk2NTQiLCJpYXQiOjE3MTQ3NTc1MDAsImV4cCI6MjAzMDExNzUwMH0.kyeFhFDXXBRC1H5V2P629O6Gnrw6VDKGWRPzqZ3jQCcLJLeo-aAkdBnCDZIXyn4bRdiouW6DK81Y0b_lYp7oVg" --compressed "https://tofu.stepup.edu.vn/tofu/api/v1/ai_conversation/sentence_sample?app_user_id=879654&app_device_id=C52416BE-6D71-4156-8D23-2483BC850836&app_v=2.1.0&platform=ios-17.5.1&device_id=C52416BE-6D71-4156-8D23-2483BC850836&topic_id=$topic_id"`

> onionGPT.txt

#onionGPT
# echo $onionGPT | jq '.data.sentence_samples[] | select(.group_description == "Cấu trúc cơ bản") | .samples[] | {'lesson_id_$lesson_id': .null, typeonionGPT_CauTrucCoBan: .null, en: .sentence_en, ipa: .ipa, vi: .sentence_vi, audio: .audio}' >> onionGPT.txt

# echo $onionGPT | jq '.data.sentence_samples[] | select(.group_description == "Từ & cụm liên quan") | .samples[] | {'lesson_id_$lesson_id': .null, typetypeonionGPT_TuVaCumTuLienQuan: .null, en: .sentence_en, ipa: .ipa, vi: .sentence_vi, audio: .audio}' >> onionGPT.txt

# echo $onionGPT | jq '.data.sentence_samples[].samples[] | {'lesson_id_$lesson_id': .null, typeonionGPT_CauTrucCoBan: .null, en: .sentence_en, ipa: .ipa, vi: .sentence_vi, audio: .audio}' >> onionGPT.txt

# echo $onionGPT | jq '.data.sentence_samples[] | .samples[] | {group_description: .group_description, en: .sentence_en, ipa: .ipa, vi: .sentence_vi, audio: .audio}'

# code onionGPT.txt

# echo $onionGPT | jq '.data.sentence_samples[] | .samples[] | {group_description: .. | select(.group_description) | .group_description, en: .sentence_en, ipa: .ipa, vi: .sentence_vi, audio: .audio}'

echo $onionGPT | jq '.data.sentence_samples[] | .samples[] | {group_description: .. | select(.group_description?), en: .sentence_en, ipa: .ipa, vi: .sentence_vi, audio: .audio}'
