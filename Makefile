git_rev	 	  = $(shell git rev-parse --short HEAD)
git_branch  = $(shell git rev-parse --abbrev-ref HEAD)
app_name	  = "lei"
app_version = "0.0.1"

target = "./target"

BuildVersion := $(app_version)_$(git_rev)

# -ldflag 参数
GOLDFLAGS = -s -w -X 'main.BuildVersion=$(BuildVersion)'

# go mod
mod:
	go mod tidy

clean:
	rm -rf $(target)

all: clean mod linux_amd64 linux_arm64 mac_amd64 mac_arm64 win_386 win_amd64

linux_amd64:
	@echo "Compiling for linux_amd64..."
	@GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o "$(target)/linux_amd64/$(app_name)" -ldflags "$(GOLDFLAGS)"
	@echo "Compile for linux_amd64 success!"
	@echo

linux_arm64:
	@echo "Compiling for linux_arm64..."
	@GOOS=linux GOARCH=arm64 CGO_ENABLED=0 go build -o "$(target)/linux_arm64/$(app_name)" -ldflags "$(GOLDFLAGS)"
	@echo "Compile for linux_arm64 success!"
	@echo

mac_amd64:
	@echo "Compiling for mac_amd64..."
	@GOOS=darwin GOARCH=amd64 CGO_ENABLED=0 go build -o "$(target)/mac_amd64/$(app_name)" -ldflags "$(GOLDFLAGS)"
	@echo "Compile for mac_amd64 success!"
	@echo

mac_arm64:
	@echo "Compiling for mac_arm64..."
	@GOOS=darwin GOARCH=arm64 CGO_ENABLED=0 go build -o "$(target)/mac_arm64/$(app_name)" -ldflags "$(GOLDFLAGS)"
	@echo "Compile for mac_arm64 success!"
	@echo

win_386:
	@echo "Compiling for win_386..."
	@GOOS=windows GOARCH=386 CGO_ENABLED=0 go build -o "$(target)/win_386/$(app_name).exe" -ldflags "$(GOLDFLAGS)"
	@echo "Compile for win_386 success!"
	@echo

win_amd64:
	@echo "Compiling for win_amd64..."
	@GOOS=windows GOARCH=amd64 CGO_ENABLED=0 go build -o "$(target)/win_amd64/$(app_name).exe" -ldflags "$(GOLDFLAGS)"
	@echo "Compile for win_amd64 success!"
	@echo
