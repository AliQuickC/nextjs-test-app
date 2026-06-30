# Стадия 1: Сборка
FROM node:18-alpine AS builder
WORKDIR /app

# Копируем зависимости
COPY package*.json ./
RUN npm ci

# Копируем исходники
COPY . .

# Сборка Next.js
RUN npm run build

# Стадия 2: Продакшен
FROM node:18-alpine AS runner
WORKDIR /app

ENV NODE_ENV=production

# Копируем standalone сборку
COPY --from=builder /app/.next/standalone ./
# Копируем статику
COPY --from=builder /app/.next/static ./.next/static
# Копируем public
COPY --from=builder /app/public ./public

EXPOSE 3000

# Запускаем сервер из standalone
CMD ["node", "server.js"]
