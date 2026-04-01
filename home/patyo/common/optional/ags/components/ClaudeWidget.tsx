import { Variable } from "ags/variable"
import { execAsync } from "ags/process"
import { interval } from "ags/time"
import { Nord } from "../lib/colors"

interface ClaudeState {
  active: boolean
  count: number
}

const claudeState = new Variable<ClaudeState>({ active: false, count: 0 })

async function pollClaude() {
  try {
    const result = await execAsync(["pgrep", "-c", "claude"])
    const count = parseInt(result.trim(), 10)
    claudeState.set({ active: count > 0, count })
  } catch {
    claudeState.set({ active: false, count: 0 })
  }
}

interval(3000, pollClaude)
pollClaude()

export function ClaudeWidget() {
  return (
    <box
      className="claude-widget"
      css={`
        padding: 4px 12px;
        border-radius: 8px;
        background-color: ${Nord.surface};
      `}
    >
      <label
        label={claudeState((s) => (s.active ? `CC ● ${s.count}` : "CC"))}
        css={claudeState((s) => `
          color: ${s.active ? Nord.purple : Nord.subtle};
          font-weight: bold;
        `)}
      />
    </box>
  )
}
