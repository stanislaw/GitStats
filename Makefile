
GIT_PROJECT_PATH ?= .

define HELP_MESSAGE
Example: GIT_PROJECT_PATH=/your/git/path make history
endef

# Self-Documented Makefile
# http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help: ## Show this help message.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo $(HELP_MESSAGE)

top: ## Top commiters
	git --git-dir $(GIT_PROJECT_PATH)/.git \
        --work-tree $(GIT_PROJECT_PATH) \
        -c mailmap.file=$(GIT_PROJECT_PATH)/.mailmap \
        shortlog -sne

top_alternative_example:
	git --git-dir $(GIT_PROJECT_PATH)/.git log --no-merges --pretty='%aN <%aE>' --since '12 months ago' | sort| uniq -c | sort -rn | nl

history: | generate-history ## Contribution history
	cat history.txt

generate-history:
	git --git-dir $(GIT_PROJECT_PATH)/.git \
        -c mailmap.file=$(GIT_PROJECT_PATH)/.mailmap \
        log \
        --encoding=utf-8 \
        --full-history \
        --reverse --format="format:%at;%aN;%aE" \
        --use-mailmap | \
        ./git-chrono-authors/git-chrono-authors > \
        history.txt

most_changed_files: ## Most changed files.
	git --git-dir $(GIT_PROJECT_PATH)/.git log -n 1000 --format=format: --name-only | egrep -v '^$$' | sort | uniq -c | sort -r | head -100
