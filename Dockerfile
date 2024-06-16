# Usa una imagen base de Python
FROM python:3.10-slim

# Establece el directorio de trabajo en la imagen Docker
WORKDIR /app

# Copia los archivos de tu aplicación al directorio de trabajo
COPY . .

# Instala las dependencias de tu aplicación
RUN pip install -r requirements.txt

# Expone el puerto en el que tu aplicación corre
EXPOSE 8000

# Comando para correr la aplicación
CMD ["python", "app.py"]
