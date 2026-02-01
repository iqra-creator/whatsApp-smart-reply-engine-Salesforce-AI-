/**
 * Author: Iqra Masood
 * Description: Fetches complete WhatsApp conversation history for a Lead
 */
public with sharing class WhatsAppConversationService {

    public static String buildConversationContext(Id leadId) {

        List<WhatsApp_Message__c> messages = [
            SELECT Direction__c, Message_Text__c, CreatedDate
            FROM WhatsApp_Message__c
            WHERE Lead__c = :leadId
            ORDER BY CreatedDate ASC
        ];

        String context = '';
        for (WhatsApp_Message__c msg : messages) {
            context += msg.Direction__c + ': ' + msg.Message_Text__c + '\n';
        }

        return context;
    }
}
