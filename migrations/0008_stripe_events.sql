-- Stripe delivers webhooks at least once and retries any delivery that does not
-- receive a 2xx response. Record each processed event id so a redelivery of the
-- same event is applied only once (task-credit grants are relative adds).
CREATE TABLE IF NOT EXISTS "stripe_events" (
  event_id TEXT PRIMARY KEY,
  type TEXT,
  processed_at TEXT DEFAULT CURRENT_TIMESTAMP
);
