import { createBinding } from "ags"
import AstalNetwork from "gi://AstalNetwork"


export default function Wifi() {
  const network = AstalNetwork.get_default();
  const wifi = createBinding(network, "wifi")

  return (
    <box visible={wifi|Boolean}>
        <label
            label={wifi}
        />
    </box>
  )
}      