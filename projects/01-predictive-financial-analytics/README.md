[← Quay lại portfolio](../../README.md)

# Predictive Financial Analytics and Risk Assessment Using Python

## Overview
Dự án này xây dựng một báo cáo tự động về tình hình của các cổ phiếu được chọn bằng ngôn ngữ lập trình Python.

## Project Structure
Viết 2–3 câu.

## Dataset
Bộ dữ liệu được sử dụng trong dự án này chứa dữ liệu lịch sử của các mã cổ phiếu tại Việt Nam. Dữ liệu được thu thập từ yahoo finance, đảm bảo tính xác thực và độ tin cậy. Bộ dữ liệu bao gồm thông tin như mã cổ phiếu, giá cổ phiếu, ROA, ROE,...theo từng ngày, tháng, năm.

## Database
Để tạo điều kiện thuận lợi cho việc quản lý và phân tích dữ liệu, một file Python đã được tạo để lưu trữ tập dữ liệu. Python cung cấp một phương pháp mạnh mẽ và hiệu quả để thực hiện phân tích chuyên sâu dữ liệu lớn. 

## Data Processing
Dữ liệu giá lịch sử được lấy qua vnstock (cổ phiếu Việt Nam) và yfinance (cổ phiếu Mỹ), sau đó chuẩn hoá về cùng định dạng gồm các cột Open, High, Low, Close, Volume với chỉ mục là ngày giao dịch, đồng thời loại bỏ các dòng thiếu giá đóng cửa. Các chỉ báo kỹ thuật như SMA20/60/100 và Bollinger Band được tính trên toàn bộ 10 năm lịch sử rồi mới cắt theo khoảng thời gian người dùng chọn, còn dữ liệu nhiều mã được ghép theo ngày chung và loại bỏ giá trị thiếu để tính lợi suất (log-return cho Efficient Frontier, lợi suất phần trăm cho CAPM và Monte Carlo). Với CAPM, lợi suất của cổ phiếu và VN-Index được trừ đi lãi suất phi rủi ro quy ra ngày, rồi quy năm theo 252 phiên giao dịch; các chỉ số tài chính (ROE, ROA, P/E, P/B) lấy từ báo cáo tài chính theo quý và năm

## Result
- Các cổ phiếu này đều đáp ứng các chỉ tiêu khắt khe của phương pháp Graham, thể hiện những chỉ số tài chính ổn định và tiềm năng tăng trưởng tốt.
- Kết quả cho thấy chiến lược này không chỉ tối ưu hóa danh mục đầu tư mà còn giảm thiểu rủi ro, khi các cổ phiếu này thể hiện sự ổn định
và tăng trưởng trong các giai đoạn thị trường khác nhau.

## Insight
Phương pháp đầu tư giá trị của Benjamin Graham đã chứng minh được tính hiệu quả trong việc phân tích và lựa chọn cổ phiếu, giúp nhà đầu tư tối ưu hóa lợi nhuận đồng thời đảm bảo tính an toàn và bền vững cho danh mục đầu tư trong bối cảnh thị trường đầy biến động.

## Technologies Used
Python

## [Report](projects/01-predictive-financial-analytics/Predictive Financial Analytics and Risk Assessment Using Python.pdf)
Viết 2–3 câu.
