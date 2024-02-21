.DEFAULT_GOAL := generate

.PHONY: generate
generate:
	@echo "Generating README..."
	@docker run --rm --volume "$(shell pwd):/terraform-docs" quay.io/terraform-docs/terraform-docs:0.17.0 markdown /terraform-docs > README.md
	@echo "Generating CHANGELOG..."
	@docker run -v "$(shell pwd):/workdir" quay.io/git-chglog/git-chglog init

