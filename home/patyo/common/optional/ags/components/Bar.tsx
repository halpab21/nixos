import { Astal } from "ags/gtk4"
import { Nord } from "../lib/colors"
import { Clock } from "./Clock"
import { OllamaWidget } from "./OllamaWidget"
import { ClaudeWidget } from "./ClaudeWidget"

export function Bar() {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  return (
    <window
      visible
      anchor={TOP | LEFT | RIGHT}
      exclusivity="exclusive"
      css={`
        background-color: ${Nord.background};
        padding: 4px 8px;
      `}
    >
      <centerbox
        css={`min-height: 32px;`}
        startWidget={
          <box halign="start" spacing={8}>
            {/* Workspaces would go here */}
          </box>
        }
        centerWidget={
          <box halign="center">
            <Clock />
          </box>
        }
        endWidget={
          <box halign="end" spacing={8}>
            <OllamaWidget />
            <ClaudeWidget />
          </box>
        }
      />
    </window>
  )
}
