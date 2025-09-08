import { createBinding, Accessor } from "ags"

import Hyprland from "gi://AstalHyprland"


export default function Submap() {
    const hyprland = Hyprland.get_default()
    const focused = createBinding(hyprland, "focusedClient")
    const title = focused.as((client) => {
      const foo = client.initial_class;
      return foo.toLowerCase();
    });
    return (
      <box>
        <label
          label={title}
        />
      </box>
    )
}

