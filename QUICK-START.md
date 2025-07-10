# 快速开始

## ⚡ 三步部署

### 1️⃣ 克隆项目
```bash
git clone <your-repository-url>
cd OneKE
```

### 2️⃣ 一键部署
```bash
# Linux/macOS
./deploy.sh

# Windows
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

1. 确保 Docker 已启动
2. 检查端口 8501 是否被占用
3. 查看日志: `./deploy.sh logs`

---

**🎯 就这么简单！开始构建你的知识图谱吧！**