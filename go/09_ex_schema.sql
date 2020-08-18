DROP VIEW IF EXISTS exitems;

CREATE VIEW exitems AS SELECT items.*, \
shippings.transaction_evidence_id, transaction_evidences.status transaction_evidence_status, shippings.status shipping_status \
FROM items \
LEFT JOIN transaction_evidences on transaction_evidences.item_id = items.id \
LEFT JOIN shippings on shippings.transaction_evidence_id = transaction_evidences.id
