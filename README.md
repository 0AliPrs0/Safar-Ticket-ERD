# 🚀 سفر تیکت - سیستم رزرو بلیط سفر

## 📖 معرفی پروژه
به **سفر تیکت** خوش آمدید! این پلتفرم جامع برای رزرو بلیط‌های سفر داخلی شامل **قطار**، **اتوبوس** و **هواپیما** طراحی شده است. با استفاده از سفر تیکت، کاربران می‌توانند به‌راحتی و در چند کلیک، بهترین گزینه‌های سفر را پیدا و رزرو کنند.

## 🛠️ فناوری‌های استفاده‌شده
- **پایگاه داده:** MySQL
- **طراحی ERD:** [Lucidchart](https://lucid.app/documents/#/home)

## 📋 دیاگرام پایگاه داده
شما می‌توانید دیاگرام را از طریق لینک زیر مشاهده کنید:

[🔗 مشاهده دیاگرام ER]([https://lucid.app/lucidchart/d58bbffb-0eed-4062-bd9c-fb75394c9f8e/edit?invitationId=inv_2a92ef1f-2e1d-4909-9176-9543f1d1c5b2&page=0_0#](https://lucid.app/lucidchart/d58bbffb-0eed-4062-bd9c-fb75394c9f8e/edit?invitationId=inv_2a92ef1f-2e1d-4909-9176-9543f1d1c5b2&page=0_0#))

---

## 📖 فهرست مطالب
- [📑 Enumها](#-enumها)  
- [🗄 جدول‌ها](#-جدول‌ها)  
- [🔗 روابط](#-روابط)  
- [⚡️ ایندکس‌ها](#-ایندکس‌ها)  
- [🚀 نحوه استفاده](#-نحوه-استفاده)  


---

## 🔢 Enumها
در این پروژه از **Enum** برای استانداردسازی مقادیر برخی فیلدها استفاده شده است:

| دسته‌بندی         | مقادیر  |
|----------------------|------------|
| نقش کاربر        | ADMIN, USER  |
| وضعیت کاربر      | ACTIVE, NON-ACTIVE  |
| نوع پرداخت     | CASH, CREDIT_CARD, WALLET, BANK_TRANSFER, CRYPTO  |
| وضعیت بلیط    | RESERVED, RESERVING, CANCELED, CANCELED-BY-TIME  |
| وضعیت پرداخت   | PENDING, COMPLETED, FAILED, REFUNDED  |
| نوع وسیله نقلیه     | BUS, TRAIN, AIRPLANE  |
| کلاس پرواز     | ECONOMY, PREMIUM-ECONOMY, BUSINESS, FIRST  |
| وضعیت فعالیت  | PENDING, REMINDER-SENT, PURCHASED  |
| وضعیت اطلاع‌رسانی | SENT, FAILED  |

---

## 🗄 جدول‌ها

### 👤 مدیریت کاربران
- `user` → اطلاعات احراز هویت کاربران (ایمیل، شماره تلفن، رمز عبور، نقش، وضعیت).  
- `profile` → اطلاعات شخصی کاربران (نام، شهر، کد ملی).  
- `report` → گزارش‌های کاربران و پاسخ‌های ادمین.  

### 🎟 رزرو و بلیط‌ها
- `reservation` → مدیریت رزروها (کاربر، بلیط، پرداخت، وضعیت).  
- `ticket` → اطلاعات بلیط‌ها (وسیله نقلیه، صندلی، مسیر، زمان حرکت/رسیدن، قیمت).  
- `payment` → مدیریت تراکنش‌های پرداخت (نوع، وضعیت، جزئیات).  
- `admin_change_reservation` → تغییرات ادمین در رزروها.  

### 🚏 اطلاعات سفر
- `route` → اطلاعات مسیرها (مبدأ، مقصد، ترمینال‌ها).  
- `city` → اطلاعات شهرها (استان، شهرستان).  
- `terminal` → اطلاعات ترمینال‌ها (نام، آدرس).  

### 🚍 وسایل نقلیه و صندلی‌ها
- `company` → اطلاعات شرکت‌های حمل‌ونقل.  
- `vehicle` → اطلاعات وسایل نقلیه (شرکت، ظرفیت، امکانات).  
- `bus, train, airplane` → اطلاعات خاص هر نوع وسیله نقلیه.  
- `seat` → اطلاعات صندلی‌ها (وسیله نقلیه، شماره صندلی، وضعیت).  
- `bus_seat, train_seat, airplane_seat` → اطلاعات صندلی‌های خاص هر وسیله نقلیه.  

### ⚡️ ویژگی‌های اضافی
- `penalty` → جریمه‌های مربوط به وسایل نقلیه.  
- `user_activity` → فعالیت‌های کاربران (مسیر، نوع وسیله نقلیه، وضعیت).  
- `notification_log` → اطلاع‌رسانی‌های ارسال‌شده به کاربران.  
- `send_email_sms` → ایمیل‌ها و پیامک‌های ارسال‌شده.  
- `send_verification_code` → کدهای تأیید ارسال‌شده به کاربران.  

---

## 🔗 روابط

| جدول | مرتبط با |
|-----------|---------------|
| `profile` | `user` (user_id) |
| `report` | `user` (هم کاربر و هم ادمین) |
| `reservation` | `user`, `ticket`, `payment` |
| `ticket` | `vehicle`, `seat`, `route` |
| `payment` | `reservation` |
| `admin_change_reservation` | `reservation`, `user` |
| `route` | `city`, `terminal` |
| `vehicle` | `company` |
| `seat` | `vehicle` |
| `user_activity` | `user`, `route` |
| `notification_log` | `user`, `send_email_sms`, `user_activity` |
| `send_verification_code` | `user`, `send_email_sms` |

---

## ⚡️ ایندکس‌ها

برای بهبود عملکرد کوئری‌ها، ایندکس‌های زیر اعمال شده‌اند:  

- ✅ `email`, `phone_number` → در جدول `user`  
- ✅ `user_id` → در جدول `profile`  
- ✅ `route_id`, `departure_time` → در جدول `ticket`  
- ✅ `origin_city_id`, `destination_city_id` → در جدول `route`  

---
