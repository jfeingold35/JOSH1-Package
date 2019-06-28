global class TriggerDisablingClass {
    global static void insertAccountIfTriggersActive_thenDisableTriggers() {
        if (Package1TriggerControl.isEnabled()) {
            Account[] accts = [SELECT Id FROM Account WHERE Name LIKE 'P1 Acc%'];
            Integer acctsExisting = accts != null && !accts.isEmpty() ? accts.size() : 0;
            
            insert new Account(Name='P1 Acc #' + (acctsExisting + 1));
            Package1TriggerControl.disable();
        }
    }
}