# Unslopify

**The anti-slop law for AI coding agents.**

Unslopify is one plain-language file of ground rules your coding agent reads
before it designs a page or writes a line, so it makes deliberate choices instead
of reaching for the same gradients, templates, and invented numbers. It sits on
top of the rules your agent already has. It never overrides them.

The whole law lives in [`unslopify.md`](unslopify.md).

## Install it in your agent

Each agent reads its instructions from a different file. Drop the matching one at
your repository root:

| Agent | File | Put it at |
| --- | --- | --- |
| Claude Code | [`integrations/claude-code/CLAUDE.md`](integrations/claude-code/CLAUDE.md) | `CLAUDE.md` |
| Codex | [`integrations/codex/AGENTS.md`](integrations/codex/AGENTS.md) | `AGENTS.md` |
| Cursor | [`integrations/cursor/.cursor/rules/unslopify.mdc`](integrations/cursor/.cursor/rules/unslopify.mdc) | `.cursor/rules/unslopify.mdc` |
| opencode | [`integrations/opencode/AGENTS.md`](integrations/opencode/AGENTS.md) | `AGENTS.md` |
| Gemini CLI | [`integrations/gemini-cli/GEMINI.md`](integrations/gemini-cli/GEMINI.md) | `GEMINI.md` |
| GitHub Copilot | [`integrations/github-copilot/.github/copilot-instructions.md`](integrations/github-copilot/.github/copilot-instructions.md) | `.github/copilot-instructions.md` |

Each file is self-contained: a short header telling the agent to follow the law,
then the full law inline. Regenerate them from `unslopify.md` with `./build.sh`.

## The site

`index.html` is a static landing page (no build step, no dependencies, fonts
self-hosted). Serve the folder with any static server:

```bash
python3 -m http.server 8000
```

## License

Use it, change it, ship it.
