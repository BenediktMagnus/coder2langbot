gcc --version

if [ "$(uname -sm)" = "Linux x86_64" ]; then
	git clone https://github.com/mgerhold/laszlo.git
	cd laszlo
	git checkout 930603b8d0f803dd80dba864535fff69d0f89cba
	cmake .
	make
	cd ..

	cp laszlo/src/laszlo "$DEPLOYDIR/laszlo"
else
	touch "$DEPLOYDIR/.unsupported-system"
fi

touch "$DEPLOYDIR/.done"

