CREATE TABLE checks (task_id TEXT PRIMARY KEY NOT NULL, done INTEGER NOT NULL DEFAULT 0, updated_at TEXT NOT NULL);
CREATE TABLE comments (id TEXT PRIMARY KEY NOT NULL, task_id TEXT NOT NULL, owner TEXT NOT NULL, progress TEXT NOT NULL, created_at TEXT NOT NULL);
CREATE INDEX comments_task_idx ON comments(task_id);
