#!/bin/bash
set -e

# Manipulate sample.properties file that the KCL application pulls properties from (ex: streamName, applicationName)
# Depending on the OS, different properties need to be changed
if [[ "$RUNNER_OS" == "macOS" ]]; then
  sed -i "" "s/streamName = .*/streamName = $STREAM_NAME/" samples/basic_sample/consumer/sample.properties
  sed -i "" "s/applicationName = .*/applicationName = $APP_NAME/" samples/basic_sample/consumer/sample.properties
  sed -i "" "s/#*idleTimeBetweenReadsInMillis.*/idleTimeBetweenReadsInMillis = 250/" samples/basic_sample/consumer/sample.properties
elif [[ "$RUNNER_OS" == "Linux" ]]; then
  sed -i "s/streamName = .*/streamName = $STREAM_NAME/" samples/basic_sample/consumer/sample.properties
  sed -i "s/applicationName = .*/applicationName = $APP_NAME/" samples/basic_sample/consumer/sample.properties
  sed -i "s/#*idleTimeBetweenReadsInMillis.*/idleTimeBetweenReadsInMillis = 250/" samples/basic_sample/consumer/sample.properties
elif [[ "$RUNNER_OS" == "Windows" ]]; then
  sed -i "s/streamName = .*/streamName = $STREAM_NAME/" samples/basic_sample/consumer/sample.properties
  sed -i "s/applicationName = .*/applicationName = $APP_NAME/" samples/basic_sample/consumer/sample.properties
  sed -i "s/#*idleTimeBetweenReadsInMillis.*/idleTimeBetweenReadsInMillis = 250/" samples/basic_sample/consumer/sample.properties
else
  echo "Unknown OS: $RUNNER_OS"
  exit 1
fi

cat samples/sample.properties