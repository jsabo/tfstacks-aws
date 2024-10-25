kubectl annotate deployment otel-demo-accountingservice \
  gremlin.com/service-id=sabo-accounting-service --overwrite -n otel-demo

kubectl annotate deployment otel-demo-adservice \
  gremlin.com/service-id=sabo-ad-service --overwrite -n otel-demo

kubectl annotate deployment otel-demo-cartservice \
  gremlin.com/service-id=sabo-cart-service --overwrite -n otel-demo

kubectl annotate deployment otel-demo-checkoutservice \
  gremlin.com/service-id=sabo-checkout-service --overwrite -n otel-demo

kubectl annotate deployment otel-demo-currencyservice \
  gremlin.com/service-id=sabo-currency-service --overwrite -n otel-demo

kubectl annotate deployment otel-demo-emailservice \
  gremlin.com/service-id=sabo-email-service --overwrite -n otel-demo

kubectl annotate deployment otel-demo-flagd \
  gremlin.com/service-id=sabo-flagd --overwrite -n otel-demo

kubectl annotate deployment otel-demo-frauddetectionservice \
  gremlin.com/service-id=sabo-fraud-detection-service --overwrite -n otel-demo

kubectl annotate deployment otel-demo-frontend \
  gremlin.com/service-id=sabo-frontend --overwrite -n otel-demo

kubectl annotate deployment otel-demo-frontendproxy \
  gremlin.com/service-id=sabo-frontend-proxy --overwrite -n otel-demo

kubectl annotate deployment otel-demo-grafana \
  gremlin.com/service-id=sabo-grafana --overwrite -n otel-demo

kubectl annotate deployment otel-demo-imageprovider \
  gremlin.com/service-id=sabo-image-provider --overwrite -n otel-demo

kubectl annotate deployment otel-demo-jaeger \
  gremlin.com/service-id=sabo-jaeger --overwrite -n otel-demo

kubectl annotate deployment otel-demo-kafka \
  gremlin.com/service-id=sabo-kafka --overwrite -n otel-demo

kubectl annotate deployment otel-demo-loadgenerator \
  gremlin.com/service-id=sabo-load-generator --overwrite -n otel-demo

kubectl annotate deployment otel-demo-otelcol \
  gremlin.com/service-id=sabo-otelcol --overwrite -n otel-demo

kubectl annotate deployment otel-demo-paymentservice \
  gremlin.com/service-id=sabo-payment-service --overwrite -n otel-demo

kubectl annotate deployment otel-demo-productcatalogservice \
  gremlin.com/service-id=sabo-product-catalog-service --overwrite -n otel-demo

kubectl annotate deployment otel-demo-prometheus-server \
  gremlin.com/service-id=sabo-prometheus-server --overwrite -n otel-demo

kubectl annotate deployment otel-demo-quoteservice \
  gremlin.com/service-id=sabo-quote-service --overwrite -n otel-demo

kubectl annotate deployment otel-demo-recommendationservice \
  gremlin.com/service-id=sabo-recommendation-service --overwrite -n otel-demo

kubectl annotate deployment otel-demo-shippingservice \
  gremlin.com/service-id=sabo-shipping-service --overwrite -n otel-demo

kubectl annotate deployment otel-demo-valkey \
  gremlin.com/service-id=sabo-valkey --overwrite -n otel-demo

