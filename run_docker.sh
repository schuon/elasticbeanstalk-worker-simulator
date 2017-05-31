#!/usr/bin/env bash

#accessKey=AKIAI2YMNBDXWCAFSHLA
#secretKey=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
#queueUrl=https://sqs.eu-west-1.amazonaws.com/426397015552/eb-local-dev
#targetUrl=http://localhost:5000/sqs-worker

./templater.sh application.properties.template > application.properties

./gradlew -Dorg.gradle.native=false bootRun
