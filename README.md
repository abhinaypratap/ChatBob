# ChatBob

- Firebase
- Networking (URLSession)
- UIKit
- Dependencies
- Model-View-Controller
- A Chat Group where people can register and send messages
- Uses Firebase Firestore to read and populate chats
- CLTypingLabel for animating characters
 
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
