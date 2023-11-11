if [ "$(uname -sm)" = "Linux x86_64" ]; then
	git clone https://github.com/PhosphorLang/PhosphorStandardLibrary.git
	cd PhosphorStandardLibrary
	git checkout 9f5d83136507c2c1a536fbc969f8fc914640f0cf
	./build.sh linuxAmd64
	cd ..

	git clone https://github.com/PhosphorLang/PhosphorCompiler.git
	cd PhosphorCompiler
	git checkout 081118952d296e91f8f3845225933ad920b1afed
	npm install
	npm run build
	cd ..

	cp -r PhosphorStandardLibrary/bin "$DEPLOYDIR/PhosphorStandardLibrary"
	cp -r PhosphorCompiler "$DEPLOYDIR"
else
	touch "$DEPLOYDIR/.unsupported-system"
fi

touch "$DEPLOYDIR/.done"
