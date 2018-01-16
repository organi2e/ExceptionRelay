# About this
A framework to catch @objc exception in swift

## Example
```
do {
  try exceptionable {
    NSException(name: .invalidArgumentException, reason: "a reason", userInfo: nil).raise()
  }
} catch {
  print(error)
}
```
more: read xctest codes in this repository.  
