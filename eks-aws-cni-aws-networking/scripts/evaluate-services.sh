#!/bin/bash

# Ensure required environment variables are set
GREMLIN_TEAM_ID=${GREMLIN_TEAM_ID:?Environment variable GREMLIN_TEAM_ID not set}
GREMLIN_API_KEY=${GREMLIN_API_KEY:?Environment variable GREMLIN_API_KEY not set}
BASE_URL="https://api.gremlin.com/v1"

# Fetch the list of RM services
echo "Fetching list of RM services for team $GREMLIN_TEAM_ID..."
response=$(curl -s -X GET \
  -H "Authorization: Key $GREMLIN_API_KEY" \
  "$BASE_URL/services?teamId=$GREMLIN_TEAM_ID")

# Check if the response is valid JSON
if ! echo "$response" | jq empty 2>/dev/null; then
  echo "Failed to fetch RM services or received invalid response. Please check your API credentials."
  exit 1
fi

# Parse and display the RM services
services=$(echo "$response" | jq -c '.items[]')
if [[ -z "$services" ]]; then
  echo "No RM services found for team $GREMLIN_TEAM_ID."
  exit 1
fi

echo "Available RM Services:"
echo "$services" | jq -r '.name'

# Iterate through the services using a for loop
for service in $(echo "$services"); do
  service_name=$(echo "$service" | jq -r '.name')
  service_id=$(echo "$service" | jq -r '.serviceId')

  echo "Service: $service_name (ID: $service_id)"
  echo "Do you want to run full tests for this service? (y/n)"
  
  # Use `read` to capture user input
  read -p "Enter choice: " answer

  if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo "Running full tests for $service_name..."
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Key $GREMLIN_API_KEY" \
      "$BASE_URL/services/$service_id/baseline?teamId=$GREMLIN_TEAM_ID" \
      -H "accept: */*" \
      -d '{}'

    if [[ $? -eq 0 ]]; then
      echo "Full tests for $service_name completed successfully."
    else
      echo "Failed to run full tests for $service_name."
    fi
  else
    echo "Skipping $service_name."
  fi
done

echo "All services processed."

