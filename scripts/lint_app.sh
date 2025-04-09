#!/bin/sh

# This script lints the application

findings_found=0
_update_findings_count() {
  findings_found=$((findings_found + 1))
}

shellcheck --external -- *.sh || _update_findings_count
shellcheck --external -- scripts/*.sh || _update_findings_count
# uncomment if subfolders are added back
#for file in scripts/**/*.sh; do
#  #shellcheck --external "$file" || _update_findings_count # extra hash avoids shell check thinking it is a directive
#done

exit $findings_found

