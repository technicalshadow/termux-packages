TERMUX_PKG_HOMEPAGE="http://gmic.eu"
TERMUX_PKG_DESCRIPTION="imageman"
TERMUX_PKG_VERSION=2.1.1
TERMUX_PKG_SHA256=f65baf6b173ad0d25155c3993d97c0dac8ed15e79addb2a76178f9308852f5a3
TERMUX_PKG_SRCURL=http://gmic.eu/files/source/gmic_$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_DEPENDS="graphicsmagick++, libcurl, fftw, libpng, libjpeg-turbo, libtiff"
TERMUX_PKG_BUILD_DEPENDS="graphicsmagick-dev"
TERMUX_PKG_NO_DEVELSPLIT=yes
TERMUX_PKG_BUILD_IN_SRC=yes

termux_step_configure() {
	return 0;
}

termux_step_make () {
	cd src/
	make cli 
}

termux_step_make_install() {
	cp src/gmic $TERMUX_PREFIX/bin/gmic
	cp src/*.h $TERMUX_PREFIX/include/
	gunzip man/gmic.1.gz
	cp man/gmic.1 $TERMUX_PREFIX/share/man/man1
}

