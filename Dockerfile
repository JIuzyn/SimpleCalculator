# Этап сборки
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы проекта и восстанавливаем зависимости
COPY SimpleCalculator/*.sln ./
COPY SimpleCalculator/*.csproj ./SimpleCalculator/
RUN dotnet restore ./SimpleCalculator/SimpleCalculator.csproj

# Копируем все файлы и собираем приложение
COPY SimpleCalculator/. ./SimpleCalculator/
RUN dotnet publish ./SimpleCalculator/SimpleCalculator.csproj -c Release -o out

# Этап выполнения
FROM mcr.microsoft.com/dotnet/runtime:6.0

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем собранное приложение из предыдущего этапа
COPY --from=build /app/out .

# Устанавливаем точку входа для приложения
ENTRYPOINT ["dotnet", "SimpleCalculator.dll"]
