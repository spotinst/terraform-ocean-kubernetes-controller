.DEFAULT_GOAL := generate

.PHONY: generate
generate:
	@echo "Generating README..."
	@docker run --rm -v "$(shell pwd):/terraform-docs" --platform "linux/amd64" quay.io/terraform-docs/terraform-docs:0.17.0 markdown table /terraform-docs
	@echo "Generating CHANGELOG..."
	@docker run --rm -v "$(shell pwd):/workdir" quay.io/git-chglog/git-chglog -o CHANGELOG.md

