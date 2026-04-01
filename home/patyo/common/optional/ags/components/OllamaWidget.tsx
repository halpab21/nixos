import { Variable } from "ags/variable"
import { execAsync } from "ags/process"
import { interval } from "ags/time"
import { Nord } from "../lib/colors"

interface OllamaState {
  status: "loaded" | "idle" | "offline"
  model: string
}

const ollamaState = new Variable<OllamaState>({ status: "offline", model: "" })

async function pollOllama() {
  try {
    const tagsRes = await execAsync(["curl", "-s", "http://localhost:11434/api/tags"])
    JSON.parse(tagsRes)

    const psRes = await execAsync(["curl", "-s", "http://localhost:11434/api/ps"])
    const ps = JSON.parse(psRes)

    if (ps.models && ps.models.length > 0) {
      const modelName = ps.models[0].name.split(":")[0]
      ollamaState.set({ status: "loaded", model: modelName })
    } else {
      ollamaState.set({ status: "idle", model: "" })
    }
  } catch {
    ollamaState.set({ status: "offline", model: "" })
  }
}

interval(5000, pollOllama)
pollOllama()

export function OllamaWidget() {
  return (
    <box
      className="ollama-widget"
      css={`
        padding: 4px 12px;
        border-radius: 8px;
        background-color: ${Nord.surface};
      `}
    >
      <label
        label={ollamaState((s) => {
          if (s.status === "loaded") return `🦙 ${s.model}`
          if (s.status === "idle") return "🦙"
          return "🦙 ✗"
        })}
        css={ollamaState((s) => {
          const color =
            s.status === "loaded" ? Nord.green :
            s.status === "idle" ? Nord.subtle :
            Nord.red
          return `color: ${color}; font-weight: bold;`
        })}
      />
    </box>
  )
}
