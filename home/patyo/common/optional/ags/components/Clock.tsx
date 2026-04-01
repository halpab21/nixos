import { createPoll } from "ags/time"
import { Nord } from "../lib/colors"

export function Clock() {
  const time = createPoll("", 1000, "date '+%H:%M'")
  const date = createPoll("", 60000, "date '+%a %d %b'")

  return (
    <box
      className="clock"
      css={`
        padding: 4px 16px;
        border-radius: 8px;
        background-color: ${Nord.surface};
      `}
    >
      <label
        label={time}
        css={`color: ${Nord.text}; font-weight: bold; margin-right: 8px;`}
      />
      <label
        label={date}
        css={`color: ${Nord.muted};`}
      />
    </box>
  )
}
