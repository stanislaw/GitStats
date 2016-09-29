
GIT_PROJECT_PATH ?= .

top:
	git --git-dir $(GIT_PROJECT_PATH)/.git \
        --work-tree $(GIT_PROJECT_PATH) \
        -c mailmap.file=$(GIT_PROJECT_PATH)/.mailmap \
        shortlog -sne

top_alternative_example:
	git --git-dir $(GIT_PROJECT_PATH)/.git log --no-merges --pretty='%aN <%aE>' --since '12 months ago' | sort| uniq -c | sort -rn | nl

history: | generate-history
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

