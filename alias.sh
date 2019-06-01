#!/bin/sh
if ! command -v whatsapp >/dev/null 2>/dev/null; then
	alias whatsapp="whatsapp-web-launcher"
fi
