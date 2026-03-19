FROM nginx:1.24.0-alpine

# Nginx phục vụ các tệp tin html và source code web tĩnh  trong thư mục /usr/share/nginx/html
# Copy source code vào thư mục /usr/share/nginx/html
COPY . /usr/share/nginx/html

# Khai báo cổng của web tĩnh trên nginx là 80 trong image, cổng mặc định khi nginx hoạt động
EXPOSE 80

# Lệnh chạy nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]