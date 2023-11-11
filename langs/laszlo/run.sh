# Save code coming from Stdin into a file:
cat >input.las

if [ -f .unsupported-system ]; then
	echo "Unsupported host system: $(uname -sm)"
	exit 1
fi

# Run the code:
exec ./laszlo input.las
