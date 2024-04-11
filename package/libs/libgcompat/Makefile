include $(TOPDIR)/rules.mk

PKG_NAME:=libgcompat
PKG_VERSION:=1.1.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=8cf1638cc5293b3c7f63d5efd3de31f2a748bcfa
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-${PKG_SOURCE_VERSION}.tar.xz
PKG_SOURCE_URL:=https://git.adelielinux.org/adelie/gcompat.git

PKG_LICENSE:=Apache
PKG_LICENSE_FILES:=LICENSE

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=0
PKG_BUILD_DEPENDS:=+libc +libucontext
PKG_FIXUP:=

include $(INCLUDE_DIR)/package.mk

define Package/libgcompat
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=a library which provides glibc compatible APIs for use on musl libc systems.
endef

define Package/libgcompat/description
	This library is designed to be used for binaries that are already compiled against glibc. It does not contain any headers, and cannot be used to build software that requires glibc. It is instead recommended that any software that requires glibc APIs be modified to become more portable.
endef


#define Build/Compile
#	$(call Build/Compile/Default,LINKER_PATH="/lib/ld-musl-riscv64.so.1",LOADER_NAME="ld-linux-riscv64-lp64d.so.1",\
#		WITH_LIBUCONTEXT=0,WITH_OBSTACK=musl-obstack)
#endef

define Package/libgcompat/install
	print "Package/libgcompat/install called"
	make LINKER_PATH="/lib/ld-musl-riscv64.so.1" LOADER_NAME="ld-linux-riscv64-lp64d.so.1" WITH_LIBUCONTEXT=1 WITH_OBSTACK=musl-obstack DESTDIR="$(1)/" install
	# $(CP) $(PKG_INSTALL_DIR)/lib/libgcompat.so.0 $(1)/lib/
        # $(CP) $(PKG_INSTALL_DIR)/lib/ld-linux-* $(1)/lib/
	pushd $(1)/lib
		for i in libc.so.6 libcrypt.so.1 libm.so.6 libpthread.so.0 libresolv.so.2 librt.so.1 libutil.so.1; do
			ln -sfv ./libgcompat.so.0 ./$i
		done
	popd
endef

$(eval $(call BuildPackage,libgcompat))
