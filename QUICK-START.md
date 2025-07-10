# 快速开始

## ⚡ 三步部署

### 1️⃣ 克隆项目
```bash
git clone <your-repository-url>
cd OneKE
```

### 2️⃣ 一键部署

**Linux/macOS:**
```bash
# 如果遇到权限问题，先添加执行权限
chmod +x deploy.sh

# 然后运行部署脚本
./deploy.sh

# 或者直接用bash运行
bash deploy.sh
```

**Windows:**
```bash
deploy.bat
```

### 3️⃣ 打开浏览器
访问 http://localhost:8501 开始使用！

## 🔧 环境要求

- Docker Desktop
- Git

## 📋 核心概念

- **OneKE-Streamlit-Frontend**: 主项目，Web前端界面
- **OneKE**: 代码依赖，提供算法支持
- **环境**: 只需要一个Python环境（前端项目的requirements.txt）

## 🛠️ 常用操作

```bash
./deploy.sh stop     # 停止
./deploy.sh restart  # 重启
./deploy.sh logs     # 查看日志
./deploy.sh shell    # 进入容器调试
```

## 🚨 遇到问题？

### 常见问题及解决方案：

1. **Permission denied 错误 (Linux/macOS)**
   ```bash
   chmod +x deploy.sh
   ./deploy.sh
   ```

2. **Docker 相关问题**
   - 确保 Docker 已启动
   - 检查 Docker 服务状态: `docker --version`

3. **端口占用问题**
   - 检查端口 8501 是否被占用
   - 修改端口: 编辑 docker-compose.yml

4. **查看详细日志**
   ```bash
   ./deploy.sh logs
   ```

5. **手动部署 (备选方案)**
   ```bash
   docker-compose up -d
   ```

---

**🎯 就这么简单！开始构建你的知识图谱吧！**