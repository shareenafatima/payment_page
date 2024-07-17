Rails.configuration.stripe = {
  publishable_key: 'pk_live_51NsoDHKeqZguyGyDTDRPn5yog7V3VedKkT5yrIXJwra3dpuDJySYtNWkkqZemZ6MnTM38A5skgEOlHoXZsQQLEjn00l9Zrwxry',
  secret_key: 'stripe_secret_key'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
