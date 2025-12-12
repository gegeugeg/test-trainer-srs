erDiagram
    USERS {
        INTEGER user_id PK
        VARCHAR username
        VARCHAR email
        TIMESTAMP created_at
    }
    
    TESTS {
        INTEGER test_id PK
        VARCHAR title
        TEXT description
        TIMESTAMP created_at
        TIMESTAMP updated_at
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

    TESTS ||--o{ QUESTIONS : "contains"
    QUESTIONS ||--o{ ANSWERS : "has"
    TESTS ||--o{ TEST_RESULTS : "has_results"
    USERS ||--o{ TEST_RESULTS : "completes"
