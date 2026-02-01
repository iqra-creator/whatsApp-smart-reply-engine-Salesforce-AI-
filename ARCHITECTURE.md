```mermaid
flowchart TD
    A[WhatsApp Chat UI] --> B[Aura Component]
    B --> C[Apex Controller]
    C --> D[Conversation Service]
    C --> E[AI Reply Service]
    E --> F[External AI Provider via Named Credential]
