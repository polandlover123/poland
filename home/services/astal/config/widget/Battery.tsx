import { createBinding } from "ags"
import AstalBattery from "gi://AstalBattery"


export default function Battery() {
  const battery = AstalBattery.get_default();
  const icone = createBinding(battery,"battery_icon_name")
  return <box class="battery">
    <image iconName={icone}/>
    <label label={createBinding(battery, "percentage").as(p =>
         `${Math.floor(p * 100)} %`
    )} />
  </box>
}      