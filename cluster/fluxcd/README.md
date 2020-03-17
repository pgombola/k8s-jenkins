# Installation

In order to install flux using the https method you need to provide a secret file that defines environment variables. This the format of the object:

```
apiVersion: v1
data:
  GIT_AUTHKEY: <base64 key>
  GIT_AUTHUSER: <base64 user>
kind: Secret
metadata:
  name: flux-git-auth
  namespace: flux
type: Opaque
```
