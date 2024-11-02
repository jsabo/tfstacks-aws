#!/bin/bash

# Usage: ./script.sh [add|remove]

ACTION=$1
NAMESPACE="otel-demo"

if [[ "$ACTION" != "add" && "$ACTION" != "remove" ]]; then
  echo "Invalid option. Use 'add' to add annotations or 'remove' to remove annotations."
  exit 1
fi

SERVICES=(
  "otel-demo-accountingservice:accounting-service"
  "otel-demo-adservice:ad-service"
  "otel-demo-cartservice:cart-service"
  "otel-demo-checkoutservice:checkout-service"
  "otel-demo-currencyservice:currency-service"
  "otel-demo-emailservice:email-service"
  "otel-demo-frauddetectionservice:fraud-detection-service"
  "otel-demo-frontend:frontend"
  "otel-demo-frontendproxy:frontend-proxy"
  "otel-demo-imageprovider:image-provider"
  "otel-demo-kafka:kafka"
  "otel-demo-paymentservice:payment-service"
  "otel-demo-productcatalogservice:product-catalog-service"
  "otel-demo-quoteservice:quote-service"
  "otel-demo-recommendationservice:recommendation-service"
  "otel-demo-shippingservice:shipping-service"
  "otel-demo-valkey:valkey"
)

for SERVICE in "${SERVICES[@]}"; do
  DEPLOYMENT_NAME="${SERVICE%%:*}"
  SERVICE_ID="${SERVICE##*:}"

  if [[ "$ACTION" == "add" ]]; then
    kubectl annotate deployment "$DEPLOYMENT_NAME" gremlin.com/service-id="$SERVICE_ID" --overwrite -n "$NAMESPACE"
  else
    kubectl annotate deployment "$DEPLOYMENT_NAME" gremlin.com/service-id- --overwrite -n "$NAMESPACE"
  fi
done

