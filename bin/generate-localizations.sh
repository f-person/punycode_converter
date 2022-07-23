#!/usr/bin/env sh

echo "Localization generation has started"

if flutter pub run intl_utils:generate; then
	echo "Successfully generated localization"
else
	exit "$?"
fi
