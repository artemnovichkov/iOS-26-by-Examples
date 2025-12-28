# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a SwiftUI application called "Developer Horoscope" that generates personalized horoscopes for developers using Apple's Foundation Models. The app integrates with GitHub to fetch user data and creates witty horoscopes based on zodiac signs and coding activity.

### Key Technologies
- **SwiftUI** - Primary UI framework
- **Foundation Models** - Apple's AI/ML framework for horoscope generation
- **ZodiacKit** - Custom framework for zodiac sign handling
- **AppIntents** - Siri Shortcuts and system integration
- **TipKit** - User onboarding and tips
- **WidgetKit** - Home screen widgets

## Build Commands

### Build Documentation
```bash
./build-docc.sh
```
This script builds DocC documentation and generates static hosting files in the `docs/` directory.

### Xcode Build
The project uses Xcode's standard build system. Build using:
- **Scheme**: "Horoscope" 
- **Target**: iOS/macOS/visionOS
- **Requirements**: Xcode 26.0 beta 4+, iOS 26.0+

## Architecture

### Core Components

1. **HoroscopeService** (`HoroscopeService.swift`)
   - Central service for AI-powered horoscope generation
   - Uses Foundation Models' `LanguageModelSession` with custom tools
   - Supports both streaming and complete result generation
   - Includes prewarming for reduced latency

2. **Tools Architecture** (`Tools/`)
   - **GithubInfoTool**: Fetches GitHub user profile and repository data
   - **UserInfoTool**: Retrieves zodiac sign and gender from Apple Health
   - Tools conform to Foundation Models' `Tool` protocol

3. **Model Layer**
   - **Horoscope** struct: Core data model for generated horoscopes
   - Uses `@Generable` for Foundation Models integration
   - Equatable for SwiftUI state management

4. **Views**
   - **ContentView**: Main app interface with mesh gradient background
   - **HoroscopeView**: Displays generated horoscope results
   - **SettingsView**: User preferences (macOS only)

5. **App Intents Integration**
   - **HoroscopeIntent**: Siri Shortcuts support
   - **HoroscopeShortcutProvider**: Dynamic shortcut management
   - Enables Spotlight search and Action Button integration

### Data Flow
1. User enters GitHub username
2. HoroscopeService creates LanguageModelSession with tools
3. UserInfoTool fetches zodiac/gender from HealthKit
4. GithubInfoTool fetches GitHub profile and repositories
5. Foundation Models generates personalized horoscope
6. Result displays in SwiftUI interface

### Platform-Specific Features
- **iOS**: Bottom toolbar, TipKit integration, sensory feedback
- **macOS**: Settings window, Spotlight integration
- **visionOS**: Adapted navigation and UI

## Testing

No explicit test targets found. Testing likely relies on:
- Xcode's built-in testing for UI components
- Manual testing with real GitHub usernames
- Foundation Models validation through usage

## Dependencies

External frameworks managed through Swift Package Manager:
- ZodiacKit (custom zodiac handling)
- Foundation Models (Apple's AI framework)

## Development Notes

- Dark color scheme enforced app-wide
- Extensive use of `@AppStorage` for username persistence
- Error handling for Foundation Models availability
- Caching implemented in GithubInfoTool for API efficiency
- Documentation built with DocC and hosted statically