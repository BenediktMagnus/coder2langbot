gcc --version

if [ "$(uname -sm)" = "Linux x86_64" ]; then
	git clone https://github.com/mgerhold/laszlo.git
	cd laszlo
	git checkout 138bd989a1fe6128cbed53ecd8a890370f85ecff
	cmake .
	make
	cd ..

	cp laszlo/src/laszlo "$DEPLOYDIR/laszlo"
else
	touch "$DEPLOYDIR/.unsupported-system"
fi

touch "$DEPLOYDIR/.done"

