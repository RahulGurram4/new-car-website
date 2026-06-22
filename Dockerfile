FROM nginx:1.27-alpine
COPY . /usr/share/nginx/html
RUN rm -f /usr/share/nginx/html/Jenkinsfile \
    /usr/share/nginx/html/README.md \
    /usr/share/nginx/html/deployment.yaml \
    /usr/share/nginx/html/service.yaml \
    /usr/share/nginx/html/alb-controller.yaml \
    /usr/share/nginx/html/carwebsite-full.yaml \
    /usr/share/nginx/html/iam_policy.json
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
