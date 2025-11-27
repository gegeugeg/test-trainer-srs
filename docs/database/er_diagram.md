# ER-диаграмма базы данных "Тренажер для подготовки к тестов"

```mermaid
erDiagram
    USERS {
        INTEGER user_id PK
        VARCHAR username
        VARCHAR email
        TIMESTAMP created_at
    }
    
    CATEGORIES {
        INTEGER category_id PK
        VARCHAR name
        TEXT description
        TIMESTAMP created_at
    }
    
    TESTS {
        INTEGER test_id PK
        VARCHAR title
        TEXT description
        TIMESTAMP created_at
        TIMESTAMP updated_at
        INTEGER user_id FK
        INTEGER category_id FK
    }
    
    QUESTIONS {
        INTEGER question_id PK
        INTEGER test_id FK
        TEXT question_text
        ENUM question_type
        INTEGER order_index
        TEXT explanation
    }
    
    ANSWERS {
        INTEGER answer_id PK
        INTEGER question_id FK
        TEXT answer_text
        BOOLEAN is_correct
        INTEGER order_index
    }
    
    TEST_RESULTS {
        INTEGER result_id PK
        INTEGER test_id FK
        INTEGER user_id FK
        INTEGER score
        INTEGER total_questions
        INTEGER time_spent
        TIMESTAMP completed_at
    }
    
    USER_ANSWERS {
        INTEGER user_answer_id PK
        INTEGER result_id FK
        INTEGER question_id FK
        INTEGER selected_answer_id FK
        TEXT user_text_answer
        BOOLEAN is_correct
    }

    USERS ||--o{ TESTS : creates
    USERS ||--o{ TEST_RESULTS : completes
    CATEGORIES ||--o{ TESTS : categorizes
    TESTS ||--o{ QUESTIONS : contains
    QUESTIONS ||--o{ ANSWERS : has
    TESTS ||--o{ TEST_RESULTS : generates
    TEST_RESULTS ||--o{ USER_ANSWERS : includes
    QUESTIONS ||--o{ USER_ANSWERS : answered_in
```

## Описание сущностей

### USERS (Пользователи)
- **user_id** - первичный ключ, уникальный идентификатор пользователя
- **username** - имя пользователя
- **email** - электронная почта
- **created_at** - дата регистрации

### CATEGORIES (Категории)
- **category_id** - первичный ключ
- **name** - название категории
- **description** - описание категории

### TESTS (Тесты)
- **test_id** - первичный ключ
- **title** - название теста
- **description** - описание теста
- **user_id** - создатель теста (внешний ключ)
- **category_id** - категория теста (внешний ключ)

### QUESTIONS (Вопросы)
- **question_id** - первичный ключ
- **test_id** - принадлежность к тесту (внешний ключ)
- **question_text** - текст вопроса
- **question_type** - тип вопроса: single, multiple, text
- **order_index** - порядок в тесте

### ANSWERS (Ответы)
- **answer_id** - первичный ключ
- **question_id** - принадлежность к вопросу (внешний ключ)
- **answer_text** - текст ответа
- **is_correct** - признак правильного ответа

### TEST_RESULTS (Результаты тестов)
- **result_id** - первичный ключ
- **test_id** - пройденный тест (внешний ключ)
- **user_id** - пользователь (внешний ключ)
- **score** - количество правильных ответов
- **total_questions** - всего вопросов в тесте
- **time_spent** - затраченное время (секунды)

### USER_ANSWERS (Ответы пользователя)
- **user_answer_id** - первичный ключ
- **result_id** - принадлежность к результату (внешний ключ)
- **question_id** - вопрос (внешний ключ)
- **selected_answer_id** - выбранный вариант (внешний ключ)
- **user_text_answer** - текстовый ответ пользователя
- **is_correct** - правильность ответа
