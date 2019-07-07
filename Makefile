app: main.sh
	mkdir -p build/
	cp -a app-template/wifi-then-bluetooth.app ./build/
	cp main.sh ./build/wifi-then-bluetooth.app/Contents/MacOS/
	chmod +x ./build/wifi-then-bluetooth.app/Contents/MacOS/main.sh