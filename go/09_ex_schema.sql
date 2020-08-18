DROP VIEW IF EXISTS exitems;

CREATE VIEW exitems AS SELECT items.*, \
shippings.transaction_evidence_id, transaction_evidences.status transaction_evidence_status, shippings.status shipping_status \
FROM items \
LEFT JOIN transaction_evidences on transaction_evidences.item_id = items.id \
LEFT JOIN shippings on shippings.transaction_evidence_id = transaction_evidences.id;

CREATE INDEX items_created_at_id_index ON items (created_at, id desc);
CREATE INDEX items_seller_id ON items (seller_id);
CREATE INDEX items_buyer_id ON items (buyer_id);
CREATE INDEX items_status ON items (status);
CREATE INDEX items_category_id ON items (category_id);
CREATE INDEX users_account_name ON users (account_name);
