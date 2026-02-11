.PHONY: help up down logs dev restart

help: ## Show this help
	@echo "Uptime Kuma - Available Commands"
	@echo ""
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

up: ## Start uptime-kuma
	docker compose up -d

down: ## Stop uptime-kuma
	docker compose down

logs: ## Show logs (follow)
	docker compose logs -f

dev: ## Start in foreground (development)
	docker compose up

restart: down up ## Restart uptime-kuma
