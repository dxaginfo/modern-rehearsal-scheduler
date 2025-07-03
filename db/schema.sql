-- Users
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name TEXT,
  email TEXT UNIQUE,
  role TEXT
);

-- Rehearsals
CREATE TABLE rehearsals (
  id SERIAL PRIMARY KEY,
  datetime TIMESTAMP,
  location TEXT,
  created_by INT REFERENCES users(id),
  type TEXT
);

-- Attendance
CREATE TABLE attendance (
  id SERIAL PRIMARY KEY,
  rehearsal_id INT REFERENCES rehearsals(id),
  user_id INT REFERENCES users(id),
  status TEXT
);

-- Notifications
CREATE TABLE notifications (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id),
  rehearsal_id INT REFERENCES rehearsals(id),
  type TEXT,
  sent_at TIMESTAMP
);
