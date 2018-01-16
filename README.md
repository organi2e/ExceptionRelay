# About this
A framework for swift to catch @objc exceptions

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
