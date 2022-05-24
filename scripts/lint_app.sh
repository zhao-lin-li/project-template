#!/bin/sh

# This script lints the application

findings_found=0
_update_findings_count() {
  findings_found=$((findings_found + 1))
}

shellcheck --external -- *.sh || _update_findings_count
for file in scripts/**/*.sh; do
  shellcheck --external "$file" || _update_findings_count
done

exit $findings_found

