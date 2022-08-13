# ChatBob
### User flow diagram of the app

```mermaid
flowchart TD
    A[Welcome Screen] --> B{Register}
    A --> C{Log In}
    B --> D[Register Screen]
    D --> G{Authentication}
    G --> E[Chat Screen]
    C --> F[Log In Screen]
    F --> G
    G --> E
    E --> H{Log Out}
    H --> A
```
