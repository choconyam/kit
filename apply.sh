#!/usr/bin/env bash
# 키트 파일을 현재 작업 폴더로 복사한다.
# 이미 있는 파일은 덮어쓰지 않는다. 네트워크, git, 설정은 건드리지 않는다.
kit="$(cd "$(dirname "$0")" && pwd)"
for f in AGENTS.md .gitignore docs/INTERVIEW.md docs/AGREEMENT.md docs/STATE.md docs/DECISIONS.md docs/HANDOFF.md; do
  if [ -e "$f" ]; then
    echo "건너뜀(이미 있음): $f"
  else
    mkdir -p "$(dirname "$f")" && cp "$kit/$f" "$f" && echo "복사함: $f"
  fi
done
echo "키트 버전: $(git -C "$kit" rev-parse --short HEAD 2>/dev/null || echo 알수없음)"
