/**
 * Author: Iqra Masood
 * Description: Generates AI-based WhatsApp reply using conversation context
 */
public with sharing class WhatsAppReplyService {

    public static String generateReply(Id leadId) {

        String conversation = WhatsAppConversationService.buildConversationContext(leadId);

        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:AI_Reply_Named_Credential');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');

        Map<String, Object> payload = new Map<String, Object>{
            'prompt' => 'Generate a professional WhatsApp reply based on the conversation:\n' + conversation
        };

        req.setBody(JSON.serialize(payload));

        Http http = new Http();
        HttpResponse res = http.send(req);

        Map<String, Object> response = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
        return (String) response.get('reply');
    }
}
