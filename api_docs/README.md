# TestSimulator API Documentation

## Mock Server URL
`[https://64405edf-a607-4bb5-9ba6-796b77b403f4.mock.pstmn.io]` 

## Endpoints

### Authentication
- `POST /auth/login` - вход пользователя

### Tests Management
- `GET /tests` - получить список тестов
- `POST /tests` - создать новый тест
- `GET /tests/:id` - получить тест по ID

### Questions
- `POST /questions` - добавить вопрос
- `GET /tests/:id/questions` - получить вопросы теста

### Results
- `POST /results` - отправить результаты теста
- `GET /users/:id/results` - получить результаты пользователя

## Пример запроса и ответа

### Успешный вход
**Request:**
```json
POST /auth/login
{
    "email": "student@university.edu",
    "password": "exam2024"
}
