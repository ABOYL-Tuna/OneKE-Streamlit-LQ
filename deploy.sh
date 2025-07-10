#!/bin/bash

# OneKE-Streamlit-Frontend 部署脚本

set -e

# 简单日志函数
log() {
    echo "[$(date +'%H:%M:%S')] $1"
}

# 检查基本环境
check_env() {
    [ ! -d "OneKE-Streamlit-Frontend" ] && { log "错误: 缺少前端项目目录"; exit 1; }
    [ ! -d "OneKE" ] && { log "错误: 缺少OneKE代码库"; exit 1; }
    [ ! -d "docker" ] && { log "错误: 缺少docker配置"; exit 1; }
    command -v docker >/dev/null || { log "错误: 请安装Docker"; exit 1; }
}

# 启动服务
start() {
    log "启动服务..."
    mkdir -p data logs uploads models
    cd docker
    docker-compose up -d
    cd ..
    log "服务已启动: http://localhost:8501"
}

# 构建镜像
build() {
    log "构建镜像..."
    cd docker
    [ "$1" = "--no-cache" ] && docker-compose build --no-cache || docker-compose build
    cd ..
}

# 停止服务
stop() {
    cd docker && docker-compose down && cd ..
}

# 重启服务
restart() {
    cd docker && docker-compose restart && cd ..
}

# 查看日志
logs() {
    cd docker && docker-compose logs -f $1 && cd ..
}

# 进入容器
shell() {
    cd docker && docker-compose exec oneke-frontend bash && cd ..
}

# 清理
cleanup() {
    echo "确定要清理所有资源吗? (y/N)"
    read -r response
    [[ "$response" =~ ^[yY]$ ]] && cd docker && docker-compose down -v --rmi all && cd ..
}

# 状态
status() {
    cd docker && docker-compose ps && cd ..
}

# 帮助
help() {
    echo "用法: $0 [命令]"
    echo "命令: start|stop|restart|build|logs|shell|status|cleanup"
    echo "示例: $0 start"
}

# 主函数
case "${1:-start}" in
    start) check_env && start ;;
    stop) stop ;;
    restart) restart ;;
    build) check_env && build $2 ;;
    logs) logs $2 ;;
    shell) shell ;;
    status) status ;;
    cleanup) cleanup ;;
    help|*) help ;;
esac