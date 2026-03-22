# Docker và triển khai docker trên ứng dụng

## 1. Giới thiệu Docker

### 1.1. Khái niệm

<img width="600" height="400" alt="image" src="https://github.com/user-attachments/assets/8dec7493-5504-4d64-b172-2dc19b510146" />

Docker là một nền tảng mã nguồn mở dùng để container hóa (containerization) ứng dụng. Nó cho phép đóng gói ứng dụng cùng toàn bộ các phụ thuộc (dependencies) của nó (mã nguồn, thư viện, công cụ hệ thống, cấu hình, runtime) vào các đơn vị tiêu chuẩn gọi là container.

### 1.2 Lịch sử phát triển

Docker được sáng lập bởi Solomon Hykes cùng các cộng sự tại công ty dotCloud vào năm 2008 – một nền tảng cung cấp dịch vụ PaaS (Platform as a Service). Ban đầu, Docker được phát triển như một công cụ nội bộ nhằm hỗ trợ việc triển khai ứng dụng trên nền tảng cloud của dotCloud một cách nhanh chóng và nhất quán.

Đến tháng 3 năm 2013, Docker chính thức được công bố dưới dạng mã nguồn mở tại sự kiện PyCon, đánh dấu bước ngoặt quan trọng trong việc phổ biến công nghệ container hóa đến cộng đồng lập trình viên toàn cầu. Sau đó, Docker nhanh chóng thu hút sự quan tâm lớn và trở thành một trong những công cụ cốt lõi trong lĩnh vực phát triển phần mềm hiện đại.

Trước khi Docker xuất hiện, các công nghệ container hóa như LXC, Solaris Zones hay OpenVZ đã tồn tại, tuy nhiên chúng thường phức tạp, khó sử dụng và yêu cầu kiến thức chuyên sâu về hệ thống. Docker đã thay đổi điều này bằng cách cung cấp giao diện dòng lệnh (CLI) đơn giản, dễ tiếp cận, đồng thời đảm bảo tính di động cao với triết lý “build once, run anywhere” (xây dựng một lần, chạy ở mọi nơi).

Trong giai đoạn từ năm 2015 đến 2020, Docker phát triển mạnh mẽ và trở thành nền tảng quan trọng cho các xu hướng như microservices, DevOps và cloud-native, đồng thời tạo tiền đề cho sự ra đời và phát triển của các công nghệ điều phối container như Kubernetes.

### 1.3 Triển khai ứng dụng thực tế bằng Docker

Docker được áp dụng trong đề tài để triển khai hệ thống chatbot tư vấn học vụ cho sinh viên, được xây dựng trên nền tảng Rasa – một framework mã nguồn mở hỗ trợ phát triển chatbot có khả năng hiểu ngôn ngữ tự nhiên và quản lý hội thoại. Hệ thống chatbot cho phép sinh viên tra cứu các thông tin học vụ như lịch học, học phí, thủ tục hành chính và các vấn đề liên quan trong quá trình học tập.

Trong quá trình phát triển, một thách thức quan trọng là đảm bảo tính đồng nhất của môi trường chạy giữa các máy tính khác nhau. Do hệ thống sử dụng nhiều thành phần như mô hình học máy, thư viện Python và các tệp cấu hình, việc cài đặt thủ công dễ dẫn đến xung đột phiên bản hoặc sai lệch môi trường, ảnh hưởng đến khả năng vận hành của chatbot.

Để khắc phục vấn đề này, Docker được sử dụng như một giải pháp triển khai hiệu quả. Toàn bộ hệ thống, bao gồm mã nguồn, dữ liệu huấn luyện, cấu hình Rasa và các thư viện phụ thuộc, được đóng gói vào một container thông qua Dockerfile. Nhờ đó, ứng dụng có thể được triển khai nhanh chóng và hoạt động nhất quán trên mọi môi trường có cài đặt Docker.

Sau khi hoàn tất quá trình xây dựng và huấn luyện mô hình, nhóm tiến hành tạo Docker image chứa toàn bộ hệ thống chatbot. Từ image này, container được khởi chạy với cơ chế ánh xạ cổng, cho phép người dùng truy cập và tương tác với chatbot thông qua giao diện hoặc API một cách thuận tiện.

Việc ứng dụng Docker không chỉ giúp đơn giản hóa quá trình triển khai mà còn nâng cao tính ổn định, khả năng tái sử dụng và mở rộng hệ thống. Đây cũng là nền tảng quan trọng để triển khai chatbot trên các môi trường máy chủ hoặc nền tảng điện toán đám mây trong tương lai.

Thông qua ví dụ trên, có thể thấy Docker đóng vai trò quan trọng trong việc hỗ trợ triển khai và vận hành hệ thống chatbot một cách hiệu quả, giúp hệ thống dễ dàng mở rộng và bảo trì trong quá trình sử dụng.

## 2. Kiến trúc Docker

### 2.1 Tổng quan về kiến trúc Docker

Docker được thiết kế theo mô hình client-server, bao gồm nhiều thành phần phối hợp với nhau để xây dựng, quản lý và chạy các container. Kiến trúc của Docker cho phép người dùng tương tác với hệ thống thông qua các lệnh đơn giản, trong khi các xử lý phức tạp được thực hiện ở phía backend.

### 2.2 Các thành phần chính

<img width="873" height="436" alt="image" src="https://github.com/user-attachments/assets/b09b60b4-9fba-4d50-8fed-02855bcadd79" />

#### 2.2.1 Docker Client

Docker Client là công cụ giúp người dùng tương tác với hệ thống Docker. Thông qua các lệnh như docker build, docker run, docker pull, người dùng có thể yêu cầu Docker thực hiện các thao tác như xây dựng image, khởi chạy container hoặc tải image từ registry.

Docker Client gửi các yêu cầu này đến Docker Daemon thông qua REST API, UNIX socket hoặc giao thức mạng. Client có thể hoạt động trên cùng một máy với Docker Daemon hoặc trên một máy khác, cho phép quản lý và điều khiển Docker từ xa một cách linh hoạt.

#### 2.2.2 Docker Daemon

Docker Daemon (dockerd) đóng vai trò như “bộ điều khiển trung tâm”, lắng nghe API request và quản lý các đối tượng như image, container, network hay volumes qua REST API. Docker Daemon cũng liên lạc với nhau để quản lý các Docker Services.

#### 2.2.3 Docker Image

Docker Image là một khuôn mẫu (template) chỉ đọc (read-only), chứa toàn bộ thông tin cần thiết để tạo ra container, bao gồm mã nguồn, thư viện, cấu hình và môi trường runtime.

Image được xây dựng từ Dockerfile thông qua lệnh docker build. Một đặc điểm quan trọng của image là được tổ chức theo dạng nhiều lớp (layers), giúp tối ưu hóa dung lượng và tăng tốc độ tải về cũng như chia sẻ.

Docker Image có thể được lưu trữ cục bộ hoặc đẩy lên các kho lưu trữ để sử dụng lại trong các môi trường khác nhau.

#### 2.2.4	Docker Container

Docker Container là một phiên bản đang chạy của Docker Image. Container là môi trường độc lập và nhẹ, trong đó ứng dụng được thực thi cùng với các thành phần phụ thuộc (dependencies) của nó.

Các container có thể được tạo, khởi động, dừng hoặc xóa một cách nhanh chóng. Nhờ cơ chế container hóa, các ứng dụng có thể chạy ổn định trên nhiều hệ thống khác nhau mà không bị ảnh hưởng bởi sự khác biệt của môi trường.

#### 2.2.5	Docker Registry (Docker Hub)
Docker Registry là hệ thống dùng để lưu trữ và phân phối các Docker Image. Docker Hub – dịch vụ lưu trữ image trên nền tảng đám mây do Docker cung cấp cho phép người dùng tìm kiếm, tải xuống và chia sẻ các image phục vụ cho nhiều mục đích như phát triển, kiểm thử và triển khai ứng dụng.
### 2.3	Các khái niệm quan trọng
#### 2.3.1	Dockerfile
Dockerfile là một file văn bản chứa các lệnh để xây dựng Docker Image. Mỗi dòng trong Dockerfile là một chỉ thị (instruction) giúp định nghĩa cách tạo image.
Dockerfile giúp tự động hóa quá trình tạo image và đảm bảo tính nhất quán.
#### 2.3.2	Volume
Volume được sử dụng để lưu trữ dữ liệu bên ngoài container, giúp dữ liệu không bị mất khi container bị xóa. Đồng thời, cho phép chia sẻ dữ liệu giữa các container và máy chủ (host).
Volume thường được sử dụng trong các ứng dụng có cơ sở dữ liệu như MySQL hoặc PostgreSQL.
#### 2.3.3	Port Mapping
Port Mapping là cơ chế ánh xạ cổng giữa container và máy chủ (host), cho phép người dùng truy cập ứng dụng đang chạy trong container. Nhờ port mapping, người dùng có thể truy cập ứng dụng thông qua trình duyệt.




