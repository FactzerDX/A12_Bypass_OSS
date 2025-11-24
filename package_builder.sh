#!/bin/bash

# ==============================
#  A12_Bypass_OSS Release Builder
#  สร้างไฟล์ release_package.tar.gz อัตโนมัติ
# ==============================

set -e

echo "[1/5] 🔍 Checking project structure..."

# ตรวจสอบว่าโฟลเดอร์ server มีอยู่จริง
if [ ! -d "server" ]; then
    echo "❌ Error: ไม่พบโฟลเดอร์ 'server'"
    exit 1
fi

# ตรวจสอบว่าโฟลเดอร์ client มีอยู่จริง
if [ ! -d "client" ]; then
    echo "❌ Error: ไม่พบโฟลเดอร์ 'client'"
    exit 1
fi

echo "[2/5] 🗂️ Preparing build directory..."

# ลบโฟลเดอร์เก่าถ้ามี
rm -rf build_release
mkdir build_release

# คัดลอกโฟลเดอร์หลักเข้า build_release
echo "[3/5] 📦 Copying files..."
cp -r server build_release/
cp -r client build_release/

# ตรวจสอบ asset ภายใน server
if [ -d "server/assets_backup" ]; then
    echo "📁 Extracting assets..."
    mkdir -p build_release/server/assets
    cp -r server/assets_backup/* build_release/server/assets/
fi

# สร้างไฟล์เวอร์ชัน
echo "[4/5] 📝 Creating version file..."
echo "Build Date: $(date)" > build_release/BUILD_INFO.txt

# สร้าง release_package.tar.gz
echo "[5/5] 🧰 Creating release_package.tar.gz..."
tar -czf release_package.tar.gz build_release

echo "🎉 สำเร็จแล้ว!"
echo "📦 คุณจะได้ไฟล์: release_package.tar.gz"
