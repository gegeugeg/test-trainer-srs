-- Соответствует исправленной ER-диаграмме
CREATE TABLE USERS (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    created_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE CATEGORIES (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    created_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE TESTS (
    test_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT,
    created_at TEXT DEFAULT (datetime('now')),
    updated_at TEXT DEFAULT (datetime('now')),
    created_by INTEGER,  -- Кто создал тест (не user_id!)
    category_id INTEGER,
    FOREIGN KEY (created_by) REFERENCES USERS(user_id) ON DELETE SET NULL,
    FOREIGN KEY (category_id) REFERENCES CATEGORIES(category_id) ON DELETE SET NULL
);

CREATE TABLE QUESTIONS (
    question_id INTEGER PRIMARY KEY AUTOINCREMENT,
    test_id INTEGER NOT NULL,
    question_text TEXT NOT NULL,
    question_type TEXT NOT NULL CHECK(question_type IN ('single', 'multiple', 'text')),
    order_index INTEGER DEFAULT 0,
    explanation TEXT,
    FOREIGN KEY (test_id) REFERENCES TESTS(test_id) ON DELETE CASCADE
);

CREATE TABLE ANSWERS (
    answer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    question_id INTEGER NOT NULL,
    answer_text TEXT NOT NULL,
    is_correct BOOLEAN DEFAULT FALSE,
    order_index INTEGER DEFAULT 0,
    FOREIGN KEY (question_id) REFERENCES QUESTIONS(question_id) ON DELETE CASCADE
);

CREATE TABLE TEST_RESULTS (
    result_id INTEGER PRIMARY KEY AUTOINCREMENT,
    test_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,  -- Кто прошел тест
    score INTEGER NOT NULL,
    total_questions INTEGER NOT NULL,
    time_spent INTEGER,
    completed_at TEXT DEFAULT (datetime('now')),
    FOREIGN KEY (test_id) REFERENCES TESTS(test_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE
);

CREATE TABLE USER_ANSWERS (
    user_answer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    result_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    user_answer_text TEXT,
    is_correct BOOLEAN,
    FOREIGN KEY (result_id) REFERENCES TEST_RESULTS(result_id) ON DELETE CASCADE
);
