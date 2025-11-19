
# DoTryCatchBootCamp

This project demonstrates simple error-handling techniques in Swift
using **do-try-catch**, **Result type**, and optional tuple-based
patterns.\
A minimal SwiftUI interface is used to trigger data fetching and show
results.

------------------------------------------------------------------------

## Project Structure

### **1. DoTryCatchDataManager**

Contains four methods showing different error-handling approaches:

-   `getTitle()` → returns tuple `(String?, Error?)`
-   `getTitle2()` → returns `Result<String, Error>`
-   `getTitle3()` → uses `throws`
-   `getTitle4()` → uses `throws`

When `isActive = false`, the methods simulate failures by returning or
throwing `URLError`.

------------------------------------------------------------------------

## ViewModel --- DoTryCatchViewModel

Uses `ObservableObject` and updates `@Published var title`.

``` swift
do {
    let newTitle = try manager.getTitle3()
    self.title = newTitle

    let finalTitle = try manager.getTitle4()
    self.title = finalTitle
} catch {
    self.title = error.localizedDescription
}
```

### Key Concept

If any throwing function fails, execution moves immediately to the
`catch` block and remaining lines will NOT run.

------------------------------------------------------------------------

## SwiftUI View --- ContentView

Displays the current title and triggers fetching when tapped.

``` swift
Text(viewModel.title)
    .frame(width: 300, height: 300)
    .background(.blue)
    .onTapGesture {
        viewModel.fetchTitle()
    }
```

------------------------------------------------------------------------

## Testing Success & Failure

To test success flow, change:

``` swift
let isActive: Bool = true
```

------------------------------------------------------------------------

## Summary

This project teaches:

-   Using Swift's `throws` mechanism
-   Handling errors using `Result`
-   Simple tuple-based error handling
-   Updating SwiftUI views with `@Published`
-   How execution stops after a thrown error
