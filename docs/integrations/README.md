# Unslopify integrations

The same law, `unslopify.md`, packaged as a drop-in file for each agent's own
convention. Each file is self-contained: a short header telling the agent to
follow the law, then the full law inline. Copy the file to the path shown, at
your repository root.

| Agent | File in this folder | Put it at |
| --- | --- | --- |
| Claude Code | `claude-code/CLAUDE.md` | `CLAUDE.md` |
| Codex | `codex/AGENTS.md` | `AGENTS.md` |
| Cursor | `cursor/.cursor/rules/unslopify.mdc` | `.cursor/rules/unslopify.mdc` |
| opencode | `opencode/AGENTS.md` | `AGENTS.md` (or the `instructions` list in `opencode.json`) |
| Gemini CLI | `gemini-cli/GEMINI.md` | `GEMINI.md` |
| GitHub Copilot | `github-copilot/copilot-instructions.md` | `.github/copilot-instructions.md` |

The law is a set of defaults. Each agent's own preset rules and your explicit
instructions win wherever they genuinely conflict. It sits on top without
fighting them.

To regenerate these files after editing `unslopify.md`, run `./build.sh` from the
repository root.
