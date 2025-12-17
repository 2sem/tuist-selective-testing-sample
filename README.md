# Tuist Selective Testing Sample

Demonstrates Tuist's selective testing feature with a modular architecture.

## Project Structure
<img width="518" height="347" alt="graph" src="https://github.com/user-attachments/assets/9a43739b-c448-409a-bb91-eb4afa61ff8f" />

```
Core (base)
├── FeatureA
└── FeatureB
    └── App
```

- **Modify Core**: All tests run
- **Modify FeatureA**: Only FeatureATests + AppTests run
- **Modify FeatureB**: Only FeatureBTests + AppTests run

## Setup

1. Update `fullHandle` in `Tuist.swift` with your Tuist Cloud org/project
2. Run `tuist auth login`
3. Run `tuist test` to establish baseline

## Try It

Edit any source file and run `tuist test` to see selective testing in action.

## Learn More

[Tuist Selective Testing Documentation](https://docs.tuist.dev/en/guides/features/selective-testing)
