### README.md

---

# togglesound


## Overview

`togglesound.bat
` is a batch script designed to help you effortlessly switch between your headset and speakers as the default sound device on a Windows system. It leverages `nircmd.exe` to handle the audio device switching.

## Prerequisites

- [nircmd.exe](https://www.nirsoft.net/utils/nircmd.html): A small command-line utility that allows you to perform various system tasks.

## Installation

1. Download `nircmd.exe` from the [official website](https://www.nirsoft.net/utils/nircmd.html).
2. Place `nircmd.exe` in a directory of your choice, e.g., `C:\toggle-sound\`.
3. Clone this repository or download `togglesound.bat
` to the same directory.

## Configuration

1. Open `togglesound.bat
` in a text editor.
2. Update the paths and device names in the script:
    - Adjust the path to `nircmd.exe` if different from `C:\toggle-sound\nircmd.exe`.
    - Replace `"HeadsetName"` with the name of your headset.
    - Replace `"SpeakerName"` with the name of your speakers.

Example:
```cmd
%nc% setdefaultsounddevice "YourHeadsetName" 1
%nc% setdefaultsounddevice "YourSpeakerName" 1
```

## Usage

1. Run `togglesound.bat
` by double-clicking it or executing it from the command line.
2. The script will toggle between your headset and speakers, updating the default sound device accordingly.

## How It Works

- The script checks if a configuration file (`togglesound.ini`) exists.
- If the file exists, it reads the current active device.
- If the active device is a headset, it switches to speakers and vice versa.
- If the file does not exist, it defaults to switching to speakers.
