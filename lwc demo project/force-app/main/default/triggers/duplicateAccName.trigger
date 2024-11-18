trigger duplicateAccName on Account (before insert) {
  AccountPhoneNotBlank.duplicateaccountName(trigger.new, null);
}