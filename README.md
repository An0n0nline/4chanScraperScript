# 4chanScraperScript
Colorful 4chan Scraper Shell Script

# 4CHAN SEARCH SCRIPT

## Description
This Bash script allows users to search for specific terms on 4chan boards using `w3m`. It supports both single scans and persistent scans, displaying the number of mentions and highlighting matches.

## Features
- Single scan mode: Searches the first 10 pages of a specified board.
- Persistent scan mode: Continuously scans the board at a user-defined interval.
- Highlights search term matches using `grep`.
- Supports up to four search terms at a time.
- Provides visual enhancements using `lolcat` and `tput`.

## Requirements
- `bash`
- `w3m`
- `grep`
- `lolcat`
- `tput`

## Installation
Ensure that all required dependencies are installed on your system:
```bash
sudo apt install w3m lolcat
```
Clone this repository or download the script manually:
```bash
git clone <repository_url>
cd <repository_directory>
chmod +x 4chan.sh
```

## Usage
Run the script using:
```bash
./4chan.sh
```

### Modes of Operation
1. **Single Scan Mode**
   - Scans a specified 4chan board for up to four search terms.
   - Searches the first 10 pages and returns the number of mentions.
   - Highlights search term occurrences.

2. **Persistent Scan Mode**
   - Continuously scans the board with a user-specified delay between scans.
   - Logs the search results at each interval.

3. **End Scan Page Visit** *(Feature not yet implemented in this script snippet)*

### Example Usage
#### Single Scan Mode
```bash
SELECT (1) SINGLE SCAN (2) PERSISTENT SCAN (3) END SCAN PAGE VISIT: 1
ENTER BOARD (EXAMPLE: B): g
ENTER SEARCH TERM 1: linux
ENTER SEARCH TERM 2: bash
ENTER SEARCH TERM 3: w3m
ENTER SEARCH TERM 4: null
```

#### Persistent Scan Mode
```bash
SELECT (1) SINGLE SCAN (2) PERSISTENT SCAN (3) END SCAN PAGE VISIT: 2
ENTER BOARD (EXAMPLE: B): g
ENTER SEARCH TERM 1: hacking
ENTER SEARCH TERM 2: tor
ENTER SEARCH TERM 3: vpn
ENTER SEARCH TERM 4: privacy
ENTER IN DELAY FOR REPEAT+LOG (SECONDS): 60
```

## Notes
- The script uses `grep` to highlight search term occurrences.
- Persistent mode will continue scanning indefinitely until terminated manually (Ctrl+C).
- `lolcat` is used for aesthetic output and can be removed if not desired.

## Disclaimer
This script is provided for educational and informational purposes only. The author is not responsible for how it is used. Please ensure compliance with 4chan's terms of service and applicable laws.

## License
This project is licensed under the MIT License.

