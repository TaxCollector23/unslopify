#!/usr/bin/env bash
# Regenerate the per-agent integration files from unslopify.md.
# Each output = an agent-specific header + the full law inline.
set -euo pipefail
cd "$(dirname "$0")"

LAW=unslopify.md
mkdir -p integrations/claude-code integrations/codex \
         integrations/cursor/.cursor/rules integrations/opencode \
         integrations/gemini-cli integrations/github-copilot

hdr() {
cat <<'EOF'
Follow the **Unslopify** law below for every piece of design, code, product copy,
architecture, and agent behavior in this repository. Read it before you start,
keep it in mind while you work, and re-check your output against it before you
finish.

It is a set of defaults, not an override. Your own preset rules and the user's
explicit instructions take precedence wherever they genuinely conflict. Absent
that, this is law.

EOF
}

{ echo "# CLAUDE.md"; echo; hdr; echo "---"; echo; cat "$LAW"; } > integrations/claude-code/CLAUDE.md
{ echo "# AGENTS.md"; echo; hdr; echo "---"; echo; cat "$LAW"; } > integrations/codex/AGENTS.md
{ echo "# AGENTS.md"; echo; hdr; echo "You can also add this file to the \`instructions\` array in \`opencode.json\`."; echo; echo "---"; echo; cat "$LAW"; } > integrations/opencode/AGENTS.md
{ echo "# GEMINI.md"; echo; hdr; echo "---"; echo; cat "$LAW"; } > integrations/gemini-cli/GEMINI.md
# Served flat (not under .github/) because GitHub Pages strips .github/ dirs.
# In your own repo this file belongs at .github/copilot-instructions.md.
{ echo "# Copilot instructions"; echo; hdr; echo "---"; echo; cat "$LAW"; } > integrations/github-copilot/copilot-instructions.md
{ printf -- '---\ndescription: Unslopify — the anti-slop law for design, code, product, and agent behavior\nalwaysApply: true\n---\n\n'; hdr; echo "---"; echo; cat "$LAW"; } > integrations/cursor/.cursor/rules/unslopify.mdc

echo "Rebuilt integration files from $LAW"
