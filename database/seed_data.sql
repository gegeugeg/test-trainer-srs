-- Тестовые данные для Тренажера тестов

-- Пользователи
INSERT INTO Users (username, email) VALUES
('student1', 'student1@example.com'),
('teacher1', 'teacher1@example.com');

-- Категории
INSERT INTO Categories (name, description) VALUES
('Программирование', 'Тесты по программированию и алгоритмам'),
('Математика', 'Математические тесты и задачи');

-- Тесты
INSERT INTO Tests (title, description, user_id, category_id) VALUES
('Основы JavaScript', 'Базовые вопросы по JavaScript', 2, 1),
('Линейная алгебра', 'Основы линейной алгебры', 2, 2);

-- Вопросы для теста по JavaScript
INSERT INTO Questions (test_id, question_text, question_type, order_index) VALUES
(1, 'Что такое JavaScript?', 'single', 1),
(1, 'Какие из перечисленных являются типами данных в JavaScript?', 'multiple', 2),
(1, 'Для чего используется оператор ===?', 'single', 3);

-- Ответы для вопросов
INSERT INTO Answers (question_id, answer_text, is_correct, order_index) VALUES
-- Ответы для вопроса 1
(1, 'Язык программирования', TRUE, 1),
(1, 'База данных', FALSE, 2),
(1, 'Операционная система', FALSE, 3),

-- Ответы для вопроса 2
(2, 'String', TRUE, 1),
(2, 'Integer', FALSE, 2),
(2, 'Boolean', TRUE, 3),
(2, 'Array', TRUE, 4),

-- Ответы для вопроса 3
(3, 'Строгого сравнения', TRUE, 1),
(3, 'Присваивания', FALSE, 2),
(3, 'Сложения', FALSE, 3);

-- Пример результата теста
INSERT INTO TestResults (test_id, user_id, score, total_questions, time_spent) VALUES
(1, 1, 2, 3, 300);
