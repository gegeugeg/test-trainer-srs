-- НОРМАЛИЗОВАННАЯ СХЕМА ДО 3NF ДЛЯ ТРЕНАЖЕРА ТЕСТОВ

-- Пользователи системы
CREATE TABLE Users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    created_at TEXT DEFAULT (datetime('now'))
);

-- Категории тестов
CREATE TABLE Categories (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    created_at TEXT DEFAULT (datetime('now'))
);

-- Тесты
CREATE TABLE Tests (
    test_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT,
    created_at TEXT DEFAULT (datetime('now')),
    updated_at TEXT DEFAULT (datetime('now')),
    user_id INTEGER NOT NULL,
    category_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE SET NULL
);

-- Вопросы теста
CREATE TABLE Questions (
    question_id INTEGER PRIMARY KEY AUTOINCREMENT,
    test_id INTEGER NOT NULL,
    question_text TEXT NOT NULL,
    question_type TEXT NOT NULL CHECK(question_type IN ('single', 'multiple', 'text')),
    order_index INTEGER DEFAULT 0,
    explanation TEXT,
    FOREIGN KEY (test_id) REFERENCES Tests(test_id) ON DELETE CASCADE
);

-- Варианты ответов
CREATE TABLE Answers (
    answer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    question_id INTEGER NOT NULL,
    answer_text TEXT NOT NULL,
    is_correct BOOLEAN DEFAULT FALSE,
    order_index INTEGER DEFAULT 0,
    FOREIGN KEY (question_id) REFERENCES Questions(question_id) ON DELETE CASCADE
);

-- Результаты тестирования
CREATE TABLE TestResults (
    result_id INTEGER PRIMARY KEY AUTOINCREMENT,
    test_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    score INTEGER NOT NULL,
    total_questions INTEGER NOT NULL,
    time_spent INTEGER, -- в секундах
    completed_at TEXT DEFAULT (datetime('now')),
    FOREIGN KEY (test_id) REFERENCES Tests(test_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Детали ответов пользователя (для анализа)
CREATE TABLE UserAnswers (
    user_answer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    result_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    selected_answer_id INTEGER,
    user_text_answer TEXT,
    is_correct BOOLEAN,
    FOREIGN KEY (result_id) REFERENCES TestResults(result_id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES Questions(question_id) ON DELETE CASCADE,
    FOREIGN KEY (selected_answer_id) REFERENCES Answers(answer_id) ON DELETE SET NULL
);

-- Индексы для оптимизации
CREATE INDEX idx_tests_user_id ON Tests(user_id);
CREATE INDEX idx_tests_category_id ON Tests(category_id);
CREATE INDEX idx_questions_test_id ON Questions(test_id);
CREATE INDEX idx_answers_question_id ON Answers(question_id);
CREATE INDEX idx_testresults_user_id ON TestResults(user_id);
CREATE INDEX idx_testresults_test_id ON TestResults(test_id);
CREATE INDEX idx_useranswers_result_id ON UserAnswers(result_id);
