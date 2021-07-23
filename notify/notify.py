#!/usr/bin/env python3
from notifypy import Notify


notification = Notify(
    default_notification_title="Great Application",
    default_notification_icon="/usr/share/icons/gnome/32x32/emblems/emblem-default.png",
)
notification.message = "Even cooler message."

notification.send()

