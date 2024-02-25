.DEFAULT_GOAL := generate

.PHONY: generate
generate:
	@echo "Generating README..."
	@docker run --rm --volume "$(shell pwd):/terraform-docs" quay.io/terraform-docs/terraform-docs:0.17.0 markdown table /terraform-docs --output-file README.md --output-template "<!-- BEGIN_TF_DOCS -->\n{{ .Content }}\n<!-- END_TF_DOCS -->"
	@echo "Generating CHANGELOG..."
	@docker run -v "$(shell pwd):/workdir" quay.io/git-chglog/git-chglog -o CHANGELOG.md

