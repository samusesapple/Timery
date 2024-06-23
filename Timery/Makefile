# 모듈 생성 명령어 사용 방법: 'make module template=ParentModule name=NewModuleName'

# GitHub 사용자 이름을 Git config에서 추출
AUTHOR=$(shell git config user.name)
CURRENT_DATE=$(shell date +%x)

# module 명령어
module:
	@echo "Making new module with the following parameters:"
	@echo "Module Template: $(template)"
	@echo "Module Name: $(name)"
	@echo "Author: $(AUTHOR)"
	@echo "Current Date: $(CURRENT_DATE)"
	@tuist scaffold $(template) --name $(name) --author $(AUTHOR) --current-date $(CURRENT_DATE)
	@echo "Successfully made new '$(template)' module, '$(name)'! Generating Tuist..."
	@tuist generate

# date 값 설정을 위한 명령어
set-date:
	$(eval CURRENT_DATE=$(value date))
