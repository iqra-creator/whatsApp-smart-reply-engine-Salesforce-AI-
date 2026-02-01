/**
 * Author: Iqra Masood
 * Description: Aura controller for WhatsApp Write For Me feature
 */
public with sharing class WhatsAppReplyController {

    @AuraEnabled
    public static String generateSmartReply(Id leadId) {
        return WhatsAppReplyService.generateReply(leadId);
    }
}
