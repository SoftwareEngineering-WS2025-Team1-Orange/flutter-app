# Bright Impact User App

A modern and feature-rich Flutter application designed to provide seamless user experiences across multiple platforms. This document outlines the app's features and tracks version updates.

---

## Table of Contents

1. [Overview](#overview)
2. [Features](#features)
3. [Version History](#version-history)
4. [Installation](#installation)

---

## Overview

The Bright Impact User App is the app for donors of Bright Impact. Each user owns a Donationbox, which offsets excess green household electricity (e.g., solar power) with computational power. The revenue generated from this computational power can be donated to charitable projects. 

With the app, users can:
- Learn about various projects.
- Donate money to charitable causes.
- Monitor the status and earnings of their Donationbox.

This Flutter app is built with a clean UI and robust functionality, designed to perform across both Android and iOS platforms.


---

## Features

### Core Features:
- ...

Additional features vary based on the app version (see below).

---

## Version History

### v0.1.0 (2024-12-11)
- First implementation of Login Page
- Implements QR code scan and registration of Donationbox
- Donationbox QR codes must represent a URL with Query parameter "sn" which contains an 8 digit serial number e.g. https://example.org/?sn=12345678
- First implementation of Home Page with static content
- Ready for demo

---

## Installation

1. Clone the repository and its submodules:
   ```bash
   git clone --recurse-submodules https://github.com/SoftwareEngineering-WS2025-Team1-Orange/flutter-app.git
   ```

2. Navigate to the project directory:
   ```bash
   cd brightimpact_user_app
   ```

3. Execute OpenAPI Client Code Generation:
   ```bash
   chmod +x generate_api_code.sh
   ./generate_api_code.sh
   ```

4. Install dependencies:
   ```bash
   flutter pub get
   ```

5. Run the app:
   ```bash
   flutter run
   ```

