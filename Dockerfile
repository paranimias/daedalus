# Etapa base con Ruby
FROM ruby:3.2-bullseye
 
# Instalar dependencias del sistema necesarias para Jekyll y compilar gemas nativas
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*
 
# Crear directorio de trabajo
WORKDIR /site
 
# Copiar Gemfile y Gemfile.lock (si existe)
COPY Gemfile Gemfile.lock* ./
 
# Instalar las gemas de Jekyll
RUN gem install bundler && \
    bundle install
 
# Exponer puerto para desarrollo (opcional)
EXPOSE 4000
 
# Comando por defecto: construir el sitio
CMD ["jekyll", "build"]
