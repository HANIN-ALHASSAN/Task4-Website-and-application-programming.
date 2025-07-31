
-- إنشاء قاعدة بيانات
CREATE DATABASE IF NOT EXISTS robot_arm;
USE robot_arm;

-- جدول بيانات المحركات
CREATE TABLE IF NOT EXISTS pose_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    motor1 INT,
    motor2 INT,
    motor3 INT,
    motor4 INT
);

-- جدول حالة التشغيل
CREATE TABLE IF NOT EXISTS run_status (
    id INT AUTO_INCREMENT PRIMARY KEY,
    status INT
);

-- إدخال بيانات مبدئية
INSERT INTO run_status (status) VALUES (1);
