# Tuist Selective Testing Sample

This project demonstrates **Tuist's selective testing** feature, which intelligently runs only the tests affected by your code changes, dramatically reducing CI/CD time.

## Project Structure

The sample is organized into a modular architecture that showcases how selective testing works at the target level:

```
SelectiveTestingSample/
├── Core/               # Base utilities (no dependencies)
│   ├── CoreUtility.swift
│   └── CoreTests/
├── FeatureA/          # Depends on Core
│   ├── FeatureAService.swift
│   └── FeatureATests/
├── FeatureB/          # Depends on Core
│   ├── FeatureBService.swift
│   └── FeatureBTests/
└── App/               # Depends on FeatureA & FeatureB
    ├── ContentView.swift
    └── AppTests/
```

### Dependency Graph
<img width="518" height="347" alt="graph" src="https://github.com/user-attachments/assets/9a43739b-c448-409a-bb91-eb4afa61ff8f" />

## How Selective Testing Works

Tuist uses its hashing algorithm to determine which tests need to run:

1. **First run**: All tests execute (CoreTests, FeatureATests, FeatureBTests, AppTests)
2. **Modify FeatureA**: Only `FeatureATests` and `AppTests` run (App depends on FeatureA)
3. **Modify FeatureB**: Only `FeatureBTests` and `AppTests` run
4. **Modify Core**: All tests run (everything depends on Core)

This target-level granularity means changes in a leaf module only trigger tests for that module and its dependents.

## Prerequisites

1. **Tuist** installed (via Mise or other method)
2. **Tuist Cloud account and project** (required for selective testing with generated projects)

## Setup

### 1. Install Tuist (if not already installed)

```bash
# Using Mise (recommended)
mise install

# Or using Homebrew
brew install tuist
```

### 2. Set up Tuist Cloud

Selective testing for generated projects requires a Tuist Cloud account:

```bash
# Create an account or log in
tuist auth

# Create a project (if not already done)
# Update the fullHandle in Tuist.swift with your org/project name
```

Make sure `Tuist.swift` has your project's full handle:

```swift
let tuist = Tuist(
    fullHandle: "your-org/tuist-selective-testing",
    project: .tuist()
)
```

### 3. Generate the project

```bash
tuist generate
```

This will create the Xcode workspace with all modules.

## Testing Selective Testing

### Initial Test Run

First, run all tests to establish the baseline hashes:

```bash
tuist test
```

All tests will run: CoreTests, FeatureATests, FeatureBTests, and AppTests.

### Test Scenario 1: Modify FeatureA

1. Edit `Projects/FeatureA/Sources/FeatureAService.swift`
2. Run tests:

```bash
tuist test
```

You'll see that only `FeatureATests` and `AppTests` execute! FeatureB and Core tests are skipped.

### Test Scenario 2: Modify Core

1. Edit `Projects/Core/Sources/CoreUtility.swift`
2. Run tests:

```bash
tuist test
```

All tests will run because both FeatureA and FeatureB depend on Core.

### Test Scenario 3: Modify FeatureB

1. Edit `Projects/FeatureB/Sources/FeatureBService.swift`
2. Run tests:

```bash
tuist test
```

Only `FeatureBTests` and `AppTests` execute.

## With UI Testing

If you add UI tests, specify a destination:

```bash
tuist test --device 'iPhone 15 Pro'
# or
tuist test -- -destination 'name=iPhone 15 Pro'
```

## Additional Features

### Binary Caching

Combine selective testing with binary caching for even faster test execution:

```bash
# Warm up the cache first
tuist cache warm

# Then run tests with cached binaries
tuist test
```

### CI Integration

When integrated with GitHub/GitLab, Tuist automatically posts PR comments showing:
- Which tests ran
- Which tests were skipped
- Why certain tests were selected

## Key Takeaways

1. **Target-level granularity**: Tests run at the target level, not individual test level
2. **Dependency awareness**: Changes propagate up the dependency tree
3. **Hash-based detection**: Tuist's hashing identifies what changed since last successful run
4. **CI optimization**: Dramatically reduces CI time for large test suites
5. **Cloud requirement**: Generated projects need a Tuist Cloud account

## Learn More

- [Tuist Selective Testing Documentation](https://docs.tuist.dev/en/guides/features/selective-testing)
- [Selective Testing with Generated Projects](https://docs.tuist.dev/en/guides/features/selective-testing/generated-project)
- [Tuist Hashing Algorithm](https://docs.tuist.dev/en/guides/features/projects/hashing)
