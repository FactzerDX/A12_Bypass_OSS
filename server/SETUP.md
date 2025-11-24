Server Backend Setup 🚀

📂 โครงสร้างไดเรกทอรี
```
/var/www/html/
├── public/
│   ├── index.php       (โค้ดประมวลผลหลัก)
│   └── cache/          (พื้นที่เก็บไฟล์ที่เข้าถึงได้จากเว็บ)
├── templates/
│   ├── bl_structure.sql
│   └── downloads_structure.sql
├── assets/
│   └── Maker/          (ไฟล์ตั้งค่าของอุปกรณ์)
├── logs/
└── cron/
    └── cleanup.php
```

🛠️ ขั้นตอนการติดตั้ง
	1.	อัปโหลดไฟล์ทั้งหมด
นำโฟลเดอร์ server ทั้งชุดขึ้นไปบนเว็บโฮสต์ของคุณ
	2.	ตั้งค่า Web Root
ปรับ Document Root ของ Nginx/Apache ให้ชี้ไปที่โฟลเดอร์ public 🌐
	3.	กำหนดสิทธิ์ให้เขียนได้
ให้เว็บเซิร์ฟเวอร์สามารถเขียนไฟล์ใน public/cache และ logs

```
chmod -R 777 public/cache logs
```

🔍 การตรวจสอบ (สร้างให้อัตโนมัติแล้ว)

หากคุณใช้สคริปต์ package_builder.sh, ระบบได้ทำสิ่งเหล่านี้ให้เรียบร้อยแล้ว:
	•	ไฟล์เทมเพลตฐานข้อมูล
downloads_structure.sql ถูกสร้างใหม่และย้ายไปไว้ใน templates/ ✔️
	•	ย้ายไฟล์ Asset อัตโนมัติ
โฟลเดอร์ Maker ถูกนำออกจากแบ็กอัปและวางไว้ใน assets/Maker/ โดยสมบูรณ์ 📦✨

👉 ไม่ต้องคัดลอกหรือแก้ชื่อไฟล์เองเพิ่มเติม

♻️ การดูแลระบบ (Maintenance)

ตั้งค่า Cron ให้ทำงานทุก 1 นาทีเพื่อจัดการลบ payload เก่าที่ไม่ใช้งานแล้ว:
```
* * * * * php /path/to/server/cron/cleanup.php
```
