// Базовые функции для работы с тестами
let tests = [];

function createNewTest() {
    const testName = prompt('Введите название теста:');
    if (testName) {
        const newTest = {
            id: Date.now(),
            name: testName,
            questions: []
        };
        tests.push(newTest);
        renderTestsList();
    }
}

function renderTestsList() {
    const testsList = document.getElementById('testsList');
    testsList.innerHTML = '';
    
    tests.forEach(test => {
        const testElement = document.createElement('div');
        testElement.className = 'test-item';
        testElement.innerHTML = `
            <h3>${test.name}</h3>
            <button onclick="startTest(${test.id})">Пройти тест</button>
            <button onclick="editTest(${test.id})">Редактировать</button>
        `;
        testsList.appendChild(testElement);
    });
}
