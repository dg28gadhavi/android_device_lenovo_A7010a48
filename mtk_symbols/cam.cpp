#include <mediautils/BatteryNotifier.h>
#include <utils/String8.h>

extern "C" {
    void _ZN7android15BatteryNotifier16noteFlashlightOnERKNS_7String8Ei (const android::String8& id, uid_t uid);

    void _ZN7android15BatteryNotifier16noteFlashlightOffERKNS_7String8Ei (const android::String8& id, uid_t uid);

    void _ZN7android15BatteryNotifier16noteResetFlashlightERKNS_7String8Ei ();
}
