# GCRYPT
GCRYPT_VERSION := 1.6.2
GCRYPT_URL := ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-$(GCRYPT_VERSION).tar.bz2
GCRYPT_GITURL := git://git.gnupg.org/libgcrypt.git

PKGS += gcrypt

$(TARBALLS)/libgcrypt-$(GCRYPT_VERSION).tar.bz2:
	$(call download,$(GCRYPT_URL))

.sum-gcrypt: libgcrypt-$(GCRYPT_VERSION).tar.bz2

$(TARBALLS)/libgcrypt-git.tar.xz:
	$(call download_git,$(GCRYPT_GITURL),,d1cadd145)

ifndef HAVE_IOS
libgcrypt: libgcrypt-$(GCRYPT_VERSION).tar.bz2 .sum-gcrypt
	$(UNPACK)
	$(APPLY) $(SRC)/gcrypt/fix-amd64-assembly-on-solaris.patch
	$(APPLY) $(SRC)/gcrypt/0001-Fix-assembly-division-check.patch
	$(MOVE)
else
libgcrypt: libgcrypt-git.tar.xz
	$(UNPACK)
	$(APPLY) $(SRC)/gcrypt/disable-doc-compilation.patch
	$(APPLY) $(SRC)/gcrypt/work-around-libtool-limitation.patch
	$(MOVE)
endif

DEPS_gcrypt = gpg-error

GCRYPT_CONF = \
	--enable-ciphers=aes,des,rfc2268,arcfour \
	--enable-digests=sha1,md5,rmd160,sha256,sha512 \
	--enable-pubkey-ciphers=dsa,rsa,ecc
ifdef HAVE_WIN64
GCRYPT_CONF += --disable-asm
endif
ifdef HAVE_IOS
GCRYPT_EXTRA_CFLAGS = -fheinous-gnu-extensions
else
GCRYPT_EXTRA_CFLAGS =
endif
ifdef HAVE_MACOSX
GCRYPT_CONF += --disable-aesni-support
ifdef HAVE_IOS
GCRYPT_CONF += --disable-asm
endif
else
ifdef HAVE_BSD
GCRYPT_CONF += --disable-asm --disable-aesni-support
endif
endif
ifdef HAVE_ANDROID
ifeq ($(ANDROID_ABI), x86)
GCRYPT_CONF += ac_cv_sys_symbol_underscore=no
endif
endif

.gcrypt: libgcrypt
	$(RECONF)
	cd $< && $(HOSTVARS) ./configure $(HOSTCONF) $(GCRYPT_CONF)
	cd $< && $(MAKE) install
	touch $@