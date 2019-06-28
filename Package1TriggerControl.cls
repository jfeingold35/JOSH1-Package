global class Package1TriggerControl {
	private static final Package1TriggerControl INSTANCE = new Package1TriggerControl();
    
    global static Package1TriggerControl getInstance() {
        return INSTANCE;
    }
    
    private Boolean disabled = false;
    
    global static void disable() {
        String hook = 'JFEIN_2.Package2TriggerControl.CrossPackageDisableHook';
        if (Type.forName(hook) != null) {
            Type.forName(hook).newInstance();
        }
        getInstance().disabled = true;
    }
    
    global static void enable() {
        String hook = 'JFEIN_2.Package2TriggerControl.CrossPackageEnableHook';
        if (Type.forName(hook) != null) {
            Type.forName(hook).newInstance();
        }
        getInstance().disabled = false;
    }
    
    global static Boolean isEnabled() {
        return !getInstance().disabled;
    }
    
    global class CrossPackageEnableHook {
        public CrossPackageEnableHook() {
            INSTANCE.disabled = false;
        }
    }
    
    global class CrossPackageDisableHook {
        public CrossPackageDisableHook() {
            INSTANCE.disabled = true;
        }
    }
}