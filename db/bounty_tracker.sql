DROP TABLE IF EXISTS bounty_details;

CREATE TABLE bounty_details (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  bounty_value INT,
  homeworld VARCHAR(255)
);
