({
    generateReply : function(component) {
        let action = component.get("c.getSmartReply");
        action.setParams({
            leadId : component.get("v.leadId")
        });

        action.setCallback(this, function(response) {
            if (response.getState() === "SUCCESS") {
                component.set("v.replyText", response.getReturnValue());
            }
        });

        $A.enqueueAction(action);
    }
})
