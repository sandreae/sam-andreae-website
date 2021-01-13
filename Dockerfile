FROM jekyll/builder AS build
WORKDIR /app
COPY . .
RUN mkdir .jekyll-cache _site \
    && jekyll build --trace

FROM nginx
COPY --from=build /app/_site /usr/share/nginx/html
EXPOSE 80
