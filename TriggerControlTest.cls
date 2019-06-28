@IsTest
private class TriggerControlTest {
    testMethod static void doTest() {
        Package1TriggerControl.disable();
        Package1TriggerControl.enable();
        Package1TriggerControl.isEnabled();
        
        Package1TriggerControl.CrossPackageEnableHook h = new Package1TriggerControl.CrossPackageEnableHook();
        TriggerDisablingClass.insertAccountIfTriggersActive_thenDisableTriggers();
    }
}