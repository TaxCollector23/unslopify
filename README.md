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
| Claude Code | [`site/integrations/claude-code/CLAUDE.md`](site/integrations/claude-code/CLAUDE.md) | `CLAUDE.md` |
| Codex | [`site/integrations/codex/AGENTS.md`](site/integrations/codex/AGENTS.md) | `AGENTS.md` |
| Cursor | [`site/integrations/cursor/.cursor/rules/unslopify.mdc`](site/integrations/cursor/.cursor/rules/unslopify.mdc) | `.cursor/rules/unslopify.mdc` |
| opencode | [`site/integrations/opencode/AGENTS.md`](site/integrations/opencode/AGENTS.md) | `AGENTS.md` |
| Gemini CLI | [`site/integrations/gemini-cli/GEMINI.md`](site/integrations/gemini-cli/GEMINI.md) | `GEMINI.md` |
| GitHub Copilot | [`site/integrations/github-copilot/copilot-instructions.md`](site/integrations/github-copilot/copilot-instructions.md) | `.github/copilot-instructions.md` |

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
