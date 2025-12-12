# ER-диаграмма базы данных "Тренажер для подготовки к тестов" (исправленная версия)

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
        INTEGER created_by FK
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
        TEXT user_answer_text
        BOOLEAN is_correct
    }

    USERS ||--o{ TESTS : "creates"
    CATEGORIES ||--o{ TESTS : "categorizes"
    TESTS ||--o{ QUESTIONS : "contains"
    QUESTIONS ||--o{ ANSWERS : "has"
    TESTS ||--o{ TEST_RESULTS : "has_results"
    USERS ||--o{ TEST_RESULTS : "completes"
    TEST_RESULTS ||--o{ USER_ANSWERS : "includes"
