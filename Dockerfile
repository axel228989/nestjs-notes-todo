# 1. Базовий образ з Node.js
FROM node:20

# 2. Встановлюємо робочу директорію в контейнері
WORKDIR /usr/src/app

# 3. Копіюємо package.json та lock-файли
COPY package*.json ./

COPY .env .env

# 4. Встановлюємо залежності
RUN npm install

# 5. Копіюємо весь код (у т.ч. src/)
COPY . .

# 6. Збираємо проєкт TypeScript → JavaScript
RUN npm run build

# 7. Відкриваємо порт
EXPOSE 3000

# 8. Запускаємо зібраний проєкт
CMD [ "node", "dist/src/main.js" ]
