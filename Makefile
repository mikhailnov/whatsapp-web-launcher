PREFIX = /usr
DATADIR = $(PREFIX)/share
BINDIR = $(PREFIX)/bin
SYSCONFDIR = /etc

all:
	echo "Nothing to do, run make install"

install:
	mkdir -p "$(DESTDIR)/$(DATADIR)/applications/"
	mkdir -p "$(DESTDIR)/$(DATADIR)/icons/"
	mkdir -p "$(DESTDIR)/$(BINDIR)"
	mkdir -p "$(DESTDIR)/$(SYSCONFDIR)/profile.d"
	install -m0755 whatsapp-web-launcher.sh "$(DESTDIR)/$(BINDIR)/whatsapp-web-launcher"
	install -m0644 iconfinder_whatsapp_287520.svg "$(DESTDIR)/$(DATADIR)/icons/whatsapp-web-launcher.svg"
	install -m0644 whatsapp-web-launcher.desktop "$(DESTDIR)/$(DATADIR)/applications/whatsapp-web-launcher.desktop"
	install -m0644 alias.sh "$(DESTDIR)/$(SYSCONFDIR)/profile.d/whatsapp-web-launcher.sh"
	
check:
	desktop-file-validate whatsapp-web-launcher.desktop
	shellcheck whatsapp-web-launcher.sh
	shellcheck alias.sh
